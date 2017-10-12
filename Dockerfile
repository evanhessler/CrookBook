FROM python:3

RUN mkdir /code
WORKDIR /code

ADD requirements.txt /code
RUN pip install -r requirements.txt

ADD . /code

EXPOSE 8000 8001
