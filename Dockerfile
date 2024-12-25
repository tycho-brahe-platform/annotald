FROM python:2.7.18-stretch

WORKDIR /app

COPY . /app

RUN pip install --no-cache-dir .

EXPOSE 8080

VOLUME /data

CMD ["python", "bin/annotald"]
