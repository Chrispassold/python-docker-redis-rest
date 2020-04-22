FROM python:3.7-alpine

ENV FLASK_APP web/app.py
ENV FLASK_RUN_HOST 0.0.0.0

RUN apk add --no-cache gcc musl-dev linux-headers

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

WORKDIR /code

COPY  /web .

ENTRYPOINT [ "python", "-m", "flask", "run" ]