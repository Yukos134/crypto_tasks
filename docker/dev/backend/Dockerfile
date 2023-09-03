# pull official base image
FROM python:3.10.0-alpine

ENV HOME /usr/src/web
# set work directory
WORKDIR $HOME

# set environment variables
ENV PYTHONDONTWRITEBYTECODE=1 \
	PYTHONUNBUFFERED=1 \
	TZ=UTC \
	LANG=en-us.UTF-8 \
	CRYPTOGRAPHY_DONT_BUILD_RUST=1

# install dependencies
RUN apk update \
    && apk add mariadb-dev gcc python3-dev musl-dev openssl libffi-dev openssl-dev \
	&& pip install --upgrade pip

COPY ./backend/src/requirements  ./requirements
RUN pip install --trusted-host pypi.org --trusted-host pypi.python.org --trusted-host files.pythonhosted.org -r ./requirements/local.txt

COPY ./docker/dev/backend/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# copy project
COPY ./backend $HOME
