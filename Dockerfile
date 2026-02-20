FROM python:3.9-slim

# Pre-copy model to avoid runtime download
COPY src/models/u2net.onnx /home/.u2net/u2net.onnx

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY src/ src/

# Model is already in /home/.u2net/; no need to duplicate it inside the container
RUN rm -f src/models/u2net.onnx

EXPOSE 5100

CMD ["python", "src/app.py"]
