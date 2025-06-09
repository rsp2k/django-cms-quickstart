FROM python:3.13

WORKDIR /app

# optimizing the docker caching behaviour
COPY requirements.in .

# upgrade pip and install pip-tools
RUN set -ex \
    && pip install --upgrade pip pip-tools

# Install hypercorn
RUN set -ex \
    && pip install --upgrade hypercorn

# Generate requirements.txt
RUN set -ex \
    && pip-compile -vU --resolver=backtracking

# Install requirements
RUN set -ex \
    python -m pip install --no-cache-dir -r requirements.txt

COPY entrypoint.sh manage.py backend .

CMD entrypoint.sh
