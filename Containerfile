FROM ghcr.io/containerpak/gtk:main

ADD --checksum=sha256:257bbc4e4ad63dbcbfcb20b6f51f44a62b734a9070607a47f5b5b02b6af36f5d https://repo.vivaldi.com/stable/deb/pool/main/vivaldi-stable_8.1.4087.64-1_amd64.deb /tmp/source
COPY icon.png /usr/share/icons/hicolor/128x128/apps/vivaldi.png

RUN apt-get update && \
    apt-get install -y --no-install-recommends libasound2t64 libgtk-3-0 libnss3 && \
    dpkg-deb -x /tmp/source / && \
    cpak-clean-junk
