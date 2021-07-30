FROM python:3.9
LABEL maintainer="allremont.kz"

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt
COPY ./app /app
COPY ./scripts /scripts

WORKDIR /app
EXPOSE 8000


RUN python -m venv /py && \
    /py/bin/pip install --upgrade pip && \
    /py/bin/pip install uwsgi && \
    /py/bin/pip install -r /requirements.txt

RUN groupadd --gid 2000 app && \
    useradd --uid 2000 --gid app --shell /bin/bash --create-home app && \
    usermod -aG sudo app && \
    mkdir -p /vol/web/static && \
    mkdir -p /vol/web/static/admin && \
    mkdir -p /vol/web/media \
    chown app:app /vol && \
    chown -R 2001:2001 /vol/web/static/admin && \
    chown -R app:app /vol && \
    chmod -R 777 /vol && \
    chmod -R 777 /vol/web/static/admin && \
    chmod -R 777 /vol/web/media && \
    chmod +x /scripts

RUN chmod +x /scripts/run.sh

ENV PATH="/scripts:/py/bin:$PATH"

USER app

CMD ["/scripts/run.sh"]