"""
CLI script for removing the background from a single image.

Usage:
    python src/cli.py <input_image> [output_image]

Examples:
    python src/cli.py photo.png
    python src/cli.py photo.png result.png
"""

import sys
from rembg import remove
from PIL import Image


def main():
    if len(sys.argv) < 2:
        print("Usage: python src/cli.py <input_image> [output_image]")
        sys.exit(1)

    input_path = sys.argv[1]
    output_path = sys.argv[2] if len(sys.argv) > 2 else "output.png"

    print(f"Processing: {input_path}")
    input_image = Image.open(input_path)
    output_image = remove(input_image)
    output_image.save(output_path)
    print(f"Saved: {output_path}")


if __name__ == "__main__":
    main()
