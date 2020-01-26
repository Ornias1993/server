FROM mcr.microsoft.com/dotnet/core/aspnet:3.1

LABEL com.bitwarden.product="bitwarden"

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        gosu \
        curl \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /LicenceGen
COPY obj/Docker/publish/LicenceGen .

