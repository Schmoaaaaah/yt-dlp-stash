FROM python:alpine

RUN mkdir -p /app
WORKDIR /app

RUN apk add --no-cache ffmpeg git
RUN pip install yt-dlp



COPY requirements.txt /app/requirements.txt
RUN pip install -r requirements.txt

COPY ./yt_dlp_plugins /app/yt_dlp_plugins
ENV PYTHONPATH=/app/
COPY ./setup.cfg /app/setup.cfg
COPY ./pyproject.toml /app/pyproject.toml

CMD [ "/bin/ash", "-c", "while true; do echo 'running' && sleep 30; done;" ]