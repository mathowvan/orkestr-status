FROM python:3.13-alpine AS base
RUN apk upgrade --no-cache
WORKDIR /app

FROM base AS test
COPY orkestr_status.py test_orkestr_status.py ./
RUN python3 -I -B -m unittest -v

FROM base AS final
COPY --from=test /app/orkestr_status.py /app/orkestr_status.py
USER 10001:10001
EXPOSE 8000
CMD ["python3", "-I", "-B", "-u", "orkestr_status.py"]
