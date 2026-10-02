FROM python:3.10-slim-bookworm

# أدوات النظام المطلوبة (مع libpq-dev لبناء psycopg2)
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    p7zip-full \
    ffmpeg \
    curl \
    ca-certificates \
    libpq-dev \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /root/sbb_b

COPY requirements.txt .

RUN pip3 install --upgrade pip setuptools wheel \
    && pip3 install --no-cache-dir -r requirements.txt

COPY . .

ENV PATH="/root/.local/bin:$PATH"

CMD ["python3", "-m", "sbb_b"]