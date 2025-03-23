# syntax=docker/dockerfile:1

FROM python:3.9.6-slim

ENV DOCKER_BUILDKIT=1

RUN --mount=target=/var/lib/apt/lists,type=cache,sharing=locked \
    --mount=target=/var/cache/apt,type=cache,sharing=locked \
    rm -f /etc/apt/apt.conf.d/docker-clean && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
    gdal-bin libgdal-dev libproj-dev python3-gdal && \
    rm -rf /var/lib/apt/lists/*
