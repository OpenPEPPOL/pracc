#!/usr/bin/env bash
set -Eeuo pipefail

# --- Resolve repo root robustly (works even if invoked from anywhere) ---
if REPO_ROOT=$(git rev-parse --show-toplevel 2>/dev/null); then
  :
else
  # Fallback: relative to this script (tools/bin/ -> repo root is ../..)
  SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
  REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
FOLDER="$REPO_ROOT"                  # project root; used by compose
LINKS_FILE="$REPO_ROOT/guides/shared/links.adoc"

# --- Source helper functions (info, etc.) ---
# shellcheck source=/dev/null
source "${SCRIPT_DIR}/functions.sh"

# --- Determine branch name (handles detached HEAD) ---
branch="$(
  git -C "$REPO_ROOT" symbolic-ref --short -q HEAD \
  || git -C "$REPO_ROOT" rev-parse --short HEAD
)"

# --- Ensure links.adoc exists & write attribute atomically ---
mkdir -p "$(dirname "$LINKS_FILE")"
tmpfile="$(mktemp "${LINKS_FILE}.XXXX")"
trap 'rm -f "$tmpfile"' EXIT

if [[ "$branch" != "master" ]]; then
  printf ':git-branch: %s/\n' "$branch" > "$tmpfile"
else
  printf ':git-branch:\n' > "$tmpfile"
fi

# Atomic move replaces the file in one step (no partial writes)
mv -f "$tmpfile" "$LINKS_FILE"
trap - EXIT

# --- Compose runner: prefer docker compose (v2), then docker-compose, then image ---
dc () {
  if command -v docker >/dev/null 2>&1 && docker compose version >/dev/null 2>&1; then
    docker compose \
      --project-directory "$FOLDER" \
      -f "$FOLDER/docker-compose.yml" \
      -p vefa-ehf-espd \
      run --rm "$@"
  elif command -v docker-compose >/dev/null 2>&1; then
    docker-compose \
      --project-directory "$FOLDER" \
      -f "$FOLDER/docker-compose.yml" \
      -p vefa-ehf-espd \
      run --rm "$@"
  else
    # Last-resort: containerized Compose with a **newer** client
    docker run --rm -i \
      -v /var/run/docker.sock:/var/run/docker.sock \
      -v "$FOLDER":/src \
      docker/compose:1.29.2 \
      --project-directory /src \
      -f /src/docker-compose.yml \
      -p vefa-ehf-espd \
      run --rm "$@"
  fi
}

info "creating files folder in target/site"
mkdir -p "${FOLDER}/target/site/files"

info "Run vefa-structure"
dc structure

pushd "$FOLDER" > /dev/null
info "Create ZIP file with schematrons"
zip -qr "target/site/files/schematrons-1.zip" "rules/"
mv "target/site/files/schematrons-1.zip" "target/site/files/schematrons.zip"
popd > /dev/null

pushd "$FOLDER" > /dev/null
info "Create ZIP file with codelists"
zip -qr "target/site/files/codelists-1.zip" "structure/codelist"
mv "target/site/files/codelists-1.zip" "target/site/files/codelists.zip"
popd > /dev/null

(
  info "Build and verify validation artifacts"
  dc validator
) &

info "Generate Asciidoctor documents"
dc asciidoctor
