FROM msoap/shell2http
RUN apk add --no-cache jq curl
COPY . /app
WORKDIR /app
CMD ["-export-vars=HOST", "-form", "-port=9924", "-timeout=15", "/metrics", "./shelly.sh"]
