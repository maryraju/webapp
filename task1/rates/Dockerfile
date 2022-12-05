FROM python:3.8-slim-buster

COPY . .

RUN pip3 install -U gunicorn
RUN pip3 install -Ur requirements.txt

ENTRYPOINT ["./gunicorn_starter.sh"]