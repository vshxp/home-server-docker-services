# MEGAcmd Docker Image
# https://github.com/meganz/MEGAcmd

FROM ubuntu:22.04

LABEL description="MEGAcmd - Command Line Interface for MEGA.nz"

ENV DEBIAN_FRONTEND=noninteractive

ARG PUID=1000
ARG PGID=1000

# Install dependencies and add MEGA repository
RUN apt-get update && apt-get install -y \
    wget \
    gnupg \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Add MEGA GPG key and repository
RUN wget -qO- https://mega.nz/keys/MEGA_signing.key | gpg --dearmor -o /usr/share/keyrings/mega-archive-keyring.gpg \
    && echo "deb [signed-by=/usr/share/keyrings/mega-archive-keyring.gpg] https://mega.nz/linux/repo/xUbuntu_22.04/ ./" > /etc/apt/sources.list.d/mega-nz.list

# Install MEGAcmd
RUN apt-get update && apt-get install -y \
    megacmd \
    && rm -rf /var/lib/apt/lists/*

# Create non-root user (security best practice)
RUN groupadd -g ${PGID} megauser \
    && useradd -m -s /bin/bash -u ${PUID} -g ${PGID} megauser

# Create directories
RUN mkdir -p /home/megauser/.megaCmd /data \
    && chown -R megauser:megauser /home/megauser /data

COPY --chown=megauser:megauser entrypoint.sh /home/megauser/entrypoint.sh
RUN chmod +x /home/megauser/entrypoint.sh

# Run as non-root user (security best practice)
USER megauser
WORKDIR /home/megauser

VOLUME ["/data"]

ENTRYPOINT ["/home/megauser/entrypoint.sh"]
