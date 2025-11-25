FROM mcr.microsoft.com/devcontainers/base:ubuntu

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    git \
    unzip \
    xz-utils \
    libglu1-mesa \
    && rm -rf /var/lib/apt/lists/*

# Install Flutter SDK
RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter
RUN git config --global --add safe.directory /usr/local/flutter


# Add Flutter + Dart to PATH
ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"

# Enable web and pre-cache artifacts
RUN flutter config --enable-web && flutter precache --web

# Doctor check
RUN flutter doctor

# Add flutterweb shortcut
RUN echo -e '#!/bin/bash\nflutter run -d web-server --web-hostname=0.0.0.0 --web-port=5000' \
    > /usr/local/bin/flutterweb && chmod +x /usr/local/bin/flutterweb
