FROM python:3.10-alpine

WORKDIR /app

COPY . .

EXPOSE 3000

RUN apk update && apk --no-cache add openssl bash curl && \
    pip install -r requirements.txt && \
    chmod +x app.py

# 明确告诉系统不要使用build
ENV PIP_NO_BUILD_ISOLATION=false
ENV PIP_NO_BUILD=1

CMD ["python3", "app.py"]
