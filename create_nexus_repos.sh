#!/bin/bash

NEXUS_URL="http://192.168.110.239:8081"
AUTH="SY14021003:shinhan1!"

create_repo() {
  local name=$1
  local type=$2
  local payload=$3

  local status=$(curl -s -o /dev/null -w "%{http_code}" -u "$AUTH" "${NEXUS_URL}/service/rest/v1/repositories/${name}")

  if [ "$status" == "200" ]; then
    echo "[SKIP] ${name} - 이미 존재"
  else
    local result=$(curl -s -o /dev/null -w "%{http_code}" -u "$AUTH" \
      -X POST "${NEXUS_URL}/service/rest/v1/repositories/${type}" \
      -H "Content-Type: application/json" -d "$payload")
    echo "[$([ "$result" == "201" ] && echo "OK" || echo "FAIL")] ${name} - HTTP ${result}"
  fi
}

create_repo "oss-maven-central-proxy" "maven/proxy" '{
  "name": "oss-maven-central-proxy", "online": true,
  "storage": { "blobStoreName": "default", "strictContentTypeValidation": true },
  "proxy": { "remoteUrl": "https://repo1.maven.org/maven2/", "contentMaxAge": -1, "metadataMaxAge": 1440 },
  "negativeCache": { "enabled": true, "timeToLive": 1440 },
  "httpClient": { "blocked": false, "autoBlock": true },
  "maven": { "versionPolicy": "RELEASE", "layoutPolicy": "STRICT", "contentDisposition": "INLINE" }
}'

create_repo "oss-maven-google-proxy" "maven/proxy" '{
  "name": "oss-maven-google-proxy", "online": true,
  "storage": { "blobStoreName": "default", "strictContentTypeValidation": true },
  "proxy": { "remoteUrl": "https://maven.google.com/", "contentMaxAge": -1, "metadataMaxAge": 1440 },
  "negativeCache": { "enabled": true, "timeToLive": 1440 },
  "httpClient": { "blocked": false, "autoBlock": true },
  "maven": { "versionPolicy": "RELEASE", "layoutPolicy": "STRICT", "contentDisposition": "INLINE" }
}'

create_repo "oss-maven-jboss-proxy" "maven/proxy" '{
  "name": "oss-maven-jboss-proxy", "online": true,
  "storage": { "blobStoreName": "default", "strictContentTypeValidation": true },
  "proxy": { "remoteUrl": "https://repository.jboss.org/nexus/service/rest/repository/browse/public/", "contentMaxAge": -1, "metadataMaxAge": 1440 },
  "negativeCache": { "enabled": true, "timeToLive": 1440 },
  "httpClient": { "blocked": false, "autoBlock": true },
  "maven": { "versionPolicy": "RELEASE", "layoutPolicy": "STRICT", "contentDisposition": "INLINE" }
}'

create_repo "oss-maven-plugin-proxy" "maven/proxy" '{
  "name": "oss-maven-plugin-proxy", "online": true,
  "storage": { "blobStoreName": "default", "strictContentTypeValidation": true },
  "proxy": { "remoteUrl": "https://repo1.maven.org/maven2/", "contentMaxAge": -1, "metadataMaxAge": 1440 },
  "negativeCache": { "enabled": true, "timeToLive": 1440 },
  "httpClient": { "blocked": false, "autoBlock": true },
  "maven": { "versionPolicy": "RELEASE", "layoutPolicy": "STRICT", "contentDisposition": "INLINE" }
}'

create_repo "oss-gradle-plugin-proxy" "maven/proxy" '{
  "name": "oss-gradle-plugin-proxy", "online": true,
  "storage": { "blobStoreName": "default", "strictContentTypeValidation": true },
  "proxy": { "remoteUrl": "https://plugins.gradle.org/m2", "contentMaxAge": -1, "metadataMaxAge": 1440 },
  "negativeCache": { "enabled": true, "timeToLive": 1440 },
  "httpClient": { "blocked": false, "autoBlock": true },
  "maven": { "versionPolicy": "RELEASE", "layoutPolicy": "STRICT", "contentDisposition": "INLINE" }
}'

create_repo "oss-maven-group" "maven/group" '{
  "name": "oss-maven-group", "online": true,
  "storage": { "blobStoreName": "default", "strictContentTypeValidation": true },
  "group": { "memberNames": ["oss-maven-central-proxy", "oss-maven-jboss-proxy", "oss-maven-google-proxy"] }
}'

create_repo "oss-npm-proxy" "npm/proxy" '{
  "name": "oss-npm-proxy", "online": true,
  "storage": { "blobStoreName": "default", "strictContentTypeValidation": true },
  "proxy": { "remoteUrl": "https://registry.npmjs.org", "contentMaxAge": 1440, "metadataMaxAge": 1440 },
  "negativeCache": { "enabled": true, "timeToLive": 1440 },
  "httpClient": { "blocked": false, "autoBlock": true }
}'

create_repo "oss-pypi-proxy" "pypi/proxy" '{
  "name": "oss-pypi-proxy", "online": true,
  "storage": { "blobStoreName": "default", "strictContentTypeValidation": true },
  "proxy": { "remoteUrl": "https://pypi.org", "contentMaxAge": 1440, "metadataMaxAge": 1440 },
  "negativeCache": { "enabled": true, "timeToLive": 1440 },
  "httpClient": { "blocked": false, "autoBlock": true }
}'
