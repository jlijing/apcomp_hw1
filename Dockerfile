# Base image
FROM python:3.11-slim-bookworm

# Ensure system packages are updated and install dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Add a non-root user
RUN useradd -m app
USER app

# Set working directory
WORKDIR /app

# Install uv (fast package installer)
RUN curl -LsSf https://astral.sh/uv/install.sh | sh

# Ensure uv is in PATH
ENV PATH="/home/app/.local/bin:$PATH"

# Copy project files
COPY --chown=app:app . /app

# Install Python dependencies with uv
RUN uv sync

# Entrypoint and CMD
ENTRYPOINT ["/bin/bash"]
CMD ["-c", "source /app/.venv/bin/activate && exec bash"]
