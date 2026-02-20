FROM python:3.9-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Download U2-Net model during build to /root/.u2net/ (where rembg expects it)
RUN python -c "from rembg.session_factory import new_session; new_session('u2net')"

COPY src/ src/

EXPOSE 5100

CMD ["python", "src/app.py"]
