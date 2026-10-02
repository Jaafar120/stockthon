FROM python:3.10-slim-buster

# أدوات النظام المطلوبة
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    p7zip-full \
    ffmpeg \
    curl \
    && rm -rf /var/lib/apt/lists/*

# مجلد العمل
WORKDIR /root/sbb_b

# نسخ المتطلبات أولًا (لاستفادة من cache)
COPY requirements.txt .

# تثبيت المتطلبات
RUN pip3 install --no-cache-dir -r requirements.txt

# نسخ بقية المشروع
COPY . .

# مسار افتراضي
ENV PATH="/root/.local/bin:$PATH"

# التشغيل
CMD ["python3", "-m", "sbb_b"]
