# mkdocs-material-image

![CI](https://github.com/platformfuzz/mkdocs-material-image/actions/workflows/ci.yml/badge.svg)
![Build and Release](https://github.com/platformfuzz/mkdocs-material-image/actions/workflows/build-and-release.yml/badge.svg)

Build and serve MkDocs Material documentation in a single Docker image.

## Overview

This repository contains a Docker image based on Python 3.13 with MkDocs and MkDocs Material pre-installed. The image is automatically built and published to GitHub Container Registry (GHCR) via GitHub Actions.

## Quick Start

### Prerequisites

Your documentation should be in a `docs` directory with:

- `mkdocs.yml` - MkDocs configuration file
- `docs/` - Your documentation source files

### Using the Pre-built Image

Pull and run the image from GitHub Container Registry:

```bash
docker pull ghcr.io/platformfuzz/mkdocs-material-image:latest
docker run -p 8000:8000 -v $(pwd)/docs:/docs ghcr.io/platformfuzz/mkdocs-material-image:latest
```

Then open your browser to `http://localhost:8000` to view your documentation.

## Local Testing

```bash
docker build -t mkdocs-material-image:latest .
docker run -p 8000:8000 -v $(pwd)/test:/docs mkdocs-material-image:latest
```

## CI/CD

The GitHub Actions workflow builds and pushes the image to GHCR on push to main or when tags are created.

## Project Structure

```plaintext
.
├── Dockerfile                 # Docker image definition
├── .dockerignore             # Files excluded from Docker build
├── .github/
│   └── workflows/
│       └── build-and-release.yml  # CI/CD workflow
├── .vscode/
│   ├── settings.json         # VS Code settings
│   └── extensions.json       # Recommended extensions
├── test/                     # Test documentation for local testing
│   ├── mkdocs.yml
│   └── docs/
└── README.md                 # This file
```

## Included Packages

The Docker image includes:

- Python 3.13
- MkDocs
- MkDocs Material
- MkDocs Minify Plugin
- MkDocs Redirects Plugin

## License

MIT License - see [LICENSE](LICENSE) file for details.
