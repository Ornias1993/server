FROM mcr.microsoft.com/dotnet/core/sdk:3.1

WORKDIR /licenseGen

COPY . /licenseGen

RUN set -e; set -x; \
	dotnet add package Newtonsoft.Json --version 12.0.3 \
	&& dotnet restore \
	&& dotnet publish

COPY /licenseGen/bin/Debug/netcoreapp3.1/publish/* /app/

ENTRYPOINT [ "dotnet", "/app/licenseGen.dll", "--core", "/app/Core.dll", "--cert", "/cert.pfx" ]
