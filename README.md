# rmbg

Remove image backgrounds with a simple web UI or CLI. Powered by [rembg](https://github.com/danielgatis/rembg) (U2-Net).

Upload an image via the browser (drag-and-drop supported), and download the result with the background removed as a transparent PNG.

## Project Structure

```
rmbg/
├── src/
│   ├── app.py            # Flask web server
│   ├── cli.py            # CLI for single image processing
│   ├── models/
│   │   └── u2net.onnx    # U2-Net model weights (git-ignored, see below)
│   └── templates/
│       └── index.html    # Web UI
├── requirements.txt
├── Dockerfile
├── .dockerignore
├── LICENSE
└── README.md
```

## Local Setup

### Prerequisites

- Python 3.9+
- pip

### Install

```bash
# Clone the repository
git clone https://github.com/shivajreddy/rmbg.git
cd rmbg

# Create and activate a virtual environment
python -m venv venv

# Linux / macOS
source venv/bin/activate

# Windows
venv\Scripts\activate

# Install dependencies
pip install -r requirements.txt
```

### Download the Model

Download the U2-Net ONNX model (~168MB) into `src/models/`:

```bash
curl -L -o src/models/u2net.onnx https://github.com/danielgatis/rembg/releases/download/v0.0.0/u2net.onnx
```

Alternatively, `rembg` will auto-download the model on first run, but pre-downloading avoids the wait.

### Run the Web Server

```bash
python src/app.py
```

Open [http://localhost:5100](http://localhost:5100) in your browser. Upload an image or drag-and-drop it onto the page. The processed image downloads automatically.

### Run the CLI

Remove the background from a single image:

```bash
# Output defaults to output.png
python src/cli.py photo.png

# Specify output path
python src/cli.py photo.png result.png
```

## Docker

### Prerequisites

- Docker

The model is downloaded automatically during the Docker build -- no manual step needed.

### Build

```bash
docker build -t rmbg .
```

### Run

```bash
docker run --rm --name rmbg -p 5100:5100 rmbg
```

Open [http://localhost:5100](http://localhost:5100).

To run in the background:

```bash
docker run -d --rm --name rmbg -p 5100:5100 rmbg
```

Stop it with:

```bash
docker stop rmbg
```

## License

[MIT](LICENSE)
