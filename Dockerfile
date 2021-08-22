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
    /py/bin/pip install -r /requirements.txt

RUN chmod -R 777 /app/client && \
    chmod +x /scripts

RUN chmod +x /scripts/run.sh

ENV PATH="/scripts:/py/bin:$PATH"


CMD ["/scripts/run.sh"]