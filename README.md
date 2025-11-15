# mkdocs-material-image

![CI](https://github.com/platformfuzz/mkdocs-material-image/actions/workflows/ci.yml/badge.svg)
![Build and Release](https://github.com/platformfuzz/mkdocs-material-image/actions/workflows/build-and-release.yml/badge.svg)

Build and serve MkDocs Material documentation in Docker images.

## Overview

This repository contains Docker images based on Python 3.13 with MkDocs and MkDocs Material pre-installed. The images are automatically built and published to GitHub Container Registry (GHCR) via GitHub Actions.

## Available Images

This repository provides two Docker images:

### Base Image (`mkdocs-material-image`)

A runtime image for serving MkDocs documentation dynamically. Mount your documentation directory and it will serve it with live reloading.

**Package:** [ghcr.io/platformfuzz/mkdocs-material-image](https://github.com/platformfuzz/mkdocs-material-image/pkgs/container/mkdocs-material-image)

### Test Image (`mkdocs-material-image-test`)

A pre-built static image containing the test documentation, served via nginx. Ready to run without mounting volumes.

**Package:** [ghcr.io/platformfuzz/mkdocs-material-image-test](https://github.com/platformfuzz/mkdocs-material-image/pkgs/container/mkdocs-material-image-test)

## Quick Start

### Using the Base Image

The base image allows you to serve your own MkDocs documentation dynamically.

**Prerequisites:**

Your documentation should be in a `docs` directory with:

- `mkdocs.yml` - MkDocs configuration file
- `docs/` - Your documentation source files

**Pull and run:**

```bash
docker pull ghcr.io/platformfuzz/mkdocs-material-image:latest
docker run -p 8000:8000 -v $(pwd)/docs:/docs ghcr.io/platformfuzz/mkdocs-material-image:latest
```

Then open your browser to `http://localhost:8000` to view your documentation.

### Using the Test Image

The test image contains pre-built static documentation and is ready to run immediately:

```bash
docker pull ghcr.io/platformfuzz/mkdocs-material-image-test:latest
docker run -p 8000:8000 ghcr.io/platformfuzz/mkdocs-material-image-test:latest
```

Open your browser to `http://localhost:8000` to view the test documentation.

## Local Testing

```bash
docker build -t mkdocs-material-image:latest .
docker run -p 8000:8000 -v $(pwd)/test:/docs mkdocs-material-image:latest
```

## CI/CD

The GitHub Actions workflow builds and pushes both images to GHCR on push to main or when tags are created. Both images are built in parallel using a matrix strategy and share the same versioning scheme.

### Automated Dependency Updates

Dependabot automatically monitors and creates pull requests for:

- **Docker base image** (`python:3.13-slim`) - checks weekly for security patches and updates
- **Python packages** (`mkdocs`, `mkdocs-material`, etc.) - checks weekly for new versions

**Fully Automated Process:**

1. Dependabot creates PRs with commit messages following the conformance format (`chore(deps): ...`)
2. CI workflow validates the build
3. Commit message conformance check validates the PR
4. Auto-merge workflow automatically merges PRs that pass all checks
5. Merging triggers the build-and-release workflow to build and push the new image

No manual intervention required - the entire update process is automated.

## Project Structure

```plaintext
.
├── Dockerfile                 # Base image definition
├── Dockerfile.test            # Test image definition (pre-built static site)
├── requirements.txt          # Python package dependencies
├── .dockerignore             # Files excluded from Docker build
├── .github/
│   ├── workflows/
│   │   └── build-and-release.yml  # CI/CD workflow
│   └── dependabot.yml        # Automated dependency updates
├── .vscode/
│   ├── settings.json         # VS Code settings
│   └── extensions.json       # Recommended extensions
├── test/                     # Test documentation for local testing
│   ├── mkdocs.yml
│   └── docs/
└── README.md                 # This file
```

## Included Packages

Both Docker images include:

- Python 3.13
- MkDocs
- MkDocs Material
- MkDocs Minify Plugin
- MkDocs Redirects Plugin

The test image additionally includes:

- Nginx (for serving static files)
- Pre-built test documentation
- Health check endpoint at `/health`

## License

MIT License - see [LICENSE](LICENSE) file for details.
