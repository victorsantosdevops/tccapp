FROM python:3.8

ENV PIP_ROOT_USER_ACTION=ignore

# Creating Application Source Code Directory
RUN mkdir -p /usr/src/app

# Setting Home Directory for containers
WORKDIR /usr/src/app

# Installing python dependencies
COPY requirements.txt /usr/src/app/

RUN pip install --no-cache-dir --upgrade -r requirements.txt

# Copying src code to Container
COPY . /usr/src/app

# Application Environment variables
#ENV APP_ENV development
ENV PORT 8080

# Exposing Ports
EXPOSE $PORT

# Setting Persistent data
VOLUME ["/app-data"]

# Running Python Application
CMD ["flask", "run", "--host", "0.0.0.0"]