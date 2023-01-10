FROM tiangolo/uvicorn-gunicorn:python3.9

LABEL maintainer="Stephen Odara <darahsten@gmail.com>"

ENV PORT 8080
ENV APP_MODULE website.api:app
ENV LOG_LEVEL debug
ENV WEB_CONCURRENCY 2

COPY ./requirements/installed.txt ./requirements/installed.txt
RUN pip install --upgrade pip
RUN pip install -r requirements/installed.txt

COPY .env /app/.env
#COPY ./app /app/app

COPY . /website /app/website

RUN chown -R www-data /app

WORKDIR /app

USER www-data
