# ---------- Builder Stage ----------
FROM python:3.11-slim AS builder

WORKDIR /build
COPY app/app.py .
# (No deps here, kept simple)

# ---------- Runtime Stage ----------
FROM python:3.11-slim

RUN useradd -m appuser
WORKDIR /app

COPY --from=builder /build/app.py .

USER appuser

EXPOSE 8080
CMD ["python3", "app.py"]
