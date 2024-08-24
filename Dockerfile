FROM nginx:1.27.1 as base


RUN apt-get update && \
    apt-get install \
    iproute2 \
    ca-certificates \
    gnupg \
    curl \
    -y && \
    rm -rf /var/lib/apt/lists/*

RUN curl -sSL https://pkgs.netbird.io/debian/public.key | gpg --dearmor --output /usr/share/keyrings/netbird-archive-keyring.gpg && \
    echo 'deb [signed-by=/usr/share/keyrings/netbird-archive-keyring.gpg] https://pkgs.netbird.io/debian stable main' > /etc/apt/sources.list.d/netbird.list

RUN apt-get update && \
    apt-get install \
    netbird \
    -y && \
    rm -rf /var/lib/apt/lists/*
