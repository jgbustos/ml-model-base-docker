# This is an official Python runtime, used as the parent image
# Python 3.13 on Debian slim
FROM python:3.13-slim

LABEL maintainer="j.garciadebustos@godeltech.com"

# OpenMP library needed by LightGBM, XGBoost, etc
RUN apt-get update \
 && apt-get install -y --no-install-recommends libgomp1 \
 && rm -rf /var/lib/apt/lists/*
 
COPY . /app
WORKDIR /app
 
RUN pip install --upgrade pip \
  && pip install --upgrade --no-cache-dir -r requirements.txt

ENTRYPOINT ["python3"]
