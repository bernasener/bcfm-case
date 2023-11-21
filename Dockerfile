# Base image olarak Python resmi imajını kullan
FROM ubuntu:20.04
ENV TZ=Europe/Istanbul
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update && apt-get install -y python3.9 pip

# Çalışma dizinini ayarla
WORKDIR /app

# Bağımlılıkları yükle
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Uygulama dosyalarını kopyala
COPY app.py .

# Uygulamayı çalıştır
CMD ["flask", "run", "--host=0.0.0.0", "--port=5000"]
