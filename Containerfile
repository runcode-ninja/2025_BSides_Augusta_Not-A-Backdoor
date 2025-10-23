# fedora latest 
FROM python:3.14

RUN mkdir /app

WORKDIR /app

ADD --chown=0:0 pyproject.toml server.py /app/

RUN pip install uv && uv sync

ENTRYPOINT uv run hypercorn -b 0.0.0.0 server.py