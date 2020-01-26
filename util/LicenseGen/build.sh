
#!/usr/bin/env bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo -e "\n## Building License Generator"

echo -e "\nBuilding app"
echo ".NET Core version $(dotnet --version)"
echo "Restore"
dotnet restore $DIR/licenseGen.csproj
echo "Clean"
dotnet clean $DIR/licenseGen.csproj -c "Release" -o $DIR/obj/Docker/publish/LicenceGen
echo "Publish"
dotnet publish $DIR/licenseGen.csproj -c "Release" -o $DIR/obj/Docker/publish/LicenceGen

echo -e "\nBuilding docker image"
docker --version
docker build -t openbitwarden/licensegen $DIR/.
