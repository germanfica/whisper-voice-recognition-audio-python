# Usa una imagen base de Python
FROM python:3.9-slim

# Configura el directorio de trabajo en el contenedor
WORKDIR /app

# Instala las dependencias de sistema necesarias
RUN apt-get update && apt-get install -y \
    ffmpeg \
    libsndfile1 \
    git \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Clona el repositorio de Whisper
RUN git clone https://github.com/openai/whisper.git

# Navega al directorio de Whisper y instala sus dependencias
WORKDIR /app/whisper
RUN pip install --upgrade pip && pip install -e .

# Expose the port (optional, in case you want to access it externally)
EXPOSE 8080

# Comando por defecto para ejecutar el contenedor
CMD ["bash"]
