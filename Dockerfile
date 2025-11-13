FROM python:3.13-slim

# Set working directory
WORKDIR /docs

# Install mkdocs and mkdocs-material
COPY requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir -r /tmp/requirements.txt

# Expose the default mkdocs port
EXPOSE 8000

# Set entrypoint to mkdocs serve
ENTRYPOINT ["mkdocs", "serve", "--dev-addr=0.0.0.0:8000"]

