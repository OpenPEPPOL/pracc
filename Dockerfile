FROM python:3-alpine

COPY target/site/ /site/pracc/

EXPOSE 8000

ENV PYTHONUNBUFFERED=TRUE

ENTRYPOINT python3 -m http.server 8000 -b 0.0.0.0 --directory /site
