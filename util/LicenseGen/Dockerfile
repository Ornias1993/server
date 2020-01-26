FROM mcr.microsoft.com/dotnet/core/sdk:3.1

FROM mcr.microsoft.com/dotnet/core/sdk:3.1

LABEL com.bitwarden.product="bitwarden"

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        gosu \
        curl \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /LicenceGen
COPY obj/Docker/publish/LicenceGen .

ENTRYPOINT [ "dotnet", "/licenseGen.dll", "--core", "/Core.dll", "--cert", "/cert.pfx" ]

