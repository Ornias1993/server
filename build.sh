#!/usr/bin/env bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo ""

if [ $# -gt 1 -a "$1" == "push" ]
then
    TAG=$2

    echo "Pushing Open-Bitwarden ($TAG)"
    echo "========================"
    
    docker push openbitwarden/api:$TAG
    docker push openbitwarden/identity:$TAG
    docker push openbitwarden/server:$TAG
    docker push openbitwarden/attachments:$TAG
    docker push openbitwarden/icons:$TAG
    docker push openbitwarden/notifications:$TAG
    docker push openbitwarden/events:$TAG
    docker push openbitwarden/admin:$TAG
    docker push openbitwarden/nginx:$TAG
    docker push openbitwarden/mssql:$TAG
    docker push openbitwarden/licensegen:$TAG
    docker push openbitwarden/setup:$TAG
elif [ $# -gt 1 -a "$1" == "tag" ]
then
    TAG=$2
    
    echo "Tagging Open-Bitwarden as '$TAG'"
    
    docker tag openbitwarden/api openbitwarden/api:$TAG
    docker tag openbitwarden/identity openbitwarden/identity:$TAG
    docker tag openbitwarden/server openbitwarden/server:$TAG
    docker tag openbitwarden/attachments openbitwarden/attachments:$TAG
    docker tag openbitwarden/icons openbitwarden/icons:$TAG
    docker tag openbitwarden/notifications openbitwarden/notifications:$TAG
    docker tag openbitwarden/events openbitwarden/events:$TAG
    docker tag openbitwarden/admin openbitwarden/admin:$TAG
    docker tag openbitwarden/nginx openbitwarden/nginx:$TAG
    docker tag openbitwarden/mssql openbitwarden/mssql:$TAG
    docker tag openbitwarden/licensegen openbitwarden/licensegen:$TAG
    docker tag openbitwarden/setup openbitwarden/setup:$TAG
else
    echo "Building Open-Bitwarden"
    echo "=================="

    chmod u+x $DIR/src/Api/build.sh
    $DIR/src/Api/build.sh

    chmod u+x $DIR/src/Identity/build.sh
    $DIR/src/Identity/build.sh

    chmod u+x $DIR/util/Server/build.sh
    $DIR/util/Server/build.sh

    chmod u+x $DIR/util/Nginx/build.sh
    $DIR/util/Nginx/build.sh

    chmod u+x $DIR/util/Attachments/build.sh
    $DIR/util/Attachments/build.sh

    chmod u+x $DIR/src/Icons/build.sh
    $DIR/src/Icons/build.sh

    chmod u+x $DIR/src/Notifications/build.sh
    $DIR/src/Notifications/build.sh

    chmod u+x $DIR/src/Events/build.sh
    $DIR/src/Events/build.sh

    chmod u+x $DIR/src/Admin/build.sh
    $DIR/src/Admin/build.sh

    chmod u+x $DIR/util/MsSql/build.sh
    $DIR/util/MsSql/build.sh

    chmod u+x $DIR/src/LicenseGen/build.sh
    $DIR/src/LicenseGen/build.sh

    chmod u+x $DIR/util/Setup/build.sh
    $DIR/util/Setup/build.sh
fi
