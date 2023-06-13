# Get the current Git branch
branch=$(git rev-parse --abbrev-ref HEAD)

# Generate the configuration file
echo ":git-branch: $branch" > config.adoc