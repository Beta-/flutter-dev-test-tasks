# Use a lightweight Ubuntu base
FROM mcr.microsoft.com/devcontainers/base:ubuntu

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl git unzip xz-utils libglu1-mesa \
    && rm -rf /var/lib/apt/lists/*

# Clone Flutter into a local, writable path inside the workspace
RUN git clone https://github.com/flutter/flutter.git /workspaces/flutter -b stable

# Add flutter to PATH for all users
ENV PATH="/workspaces/flutter/bin:$PATH"

# Enable Flutter web + pre-cache
RUN flutter config --enable-web && flutter precache --web

# Check installation
RUN flutter doctor

# Optional: add a helper command to run Flutter web quickly
RUN echo -e '#!/bin/bash\ncd /workspaces/coding-task && flutter run -d web-server --web-hostname=0.0.0.0 --web-port=5000' \
    > /usr/local/bin/flutterweb && chmod +x /usr/local/bin/flutterweb
