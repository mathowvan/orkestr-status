FROM python:3.13-slim-trixie
RUN apt-get update \
    && apt-get -y upgrade \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY orkestr_status.py /app/orkestr_status.py
USER 10001:10001
EXPOSE 8000
CMD ["python3", "-I", "-B", "-u", "orkestr_status.py"]
