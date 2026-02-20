FROM python:3.9-slim

# Download U2-Net model during build
ADD https://github.com/danielgatis/rembg/releases/download/v0.0.0/u2net.onnx /home/.u2net/u2net.onnx

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY src/ src/

EXPOSE 5100

CMD ["python", "src/app.py"]
