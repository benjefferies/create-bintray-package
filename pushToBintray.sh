#!/usr/bin/env bash

set -x

# Required: BINTRAY_TOKEN
# Required: BINTRAY_USER
# Required: BINTRAY_REPO
# Required: PACKAGE_NAME
# Required: PACKAGE_DESCRIPTION
# Required: PACKAGE_URL
# Required: PACKAGE_LICENSE

API=https://api.bintray.com

main() {
  CURL="curl -u${BINTRAY_USER}:${BINTRAY_TOKEN} -H Content-Type:application/json -H Accept:application/json"
  if (! package_exists); then
    echo "The package ${PACKAGE_NAME} does not exit. It will be created"
    create_package
  fi

}

package_exists() {
  echo "Checking if package ${PACKAGE_NAME} exists..."
  package_exists=$([ $(${CURL} --write-out %{http_code} --silent --output /dev/null -X GET  ${API}/packages/${BINTRAY_USER}/${BINTRAY_REPO}/${PACKAGE_NAME})  -eq 200 ] && echo 0 || echo 1)
  echo "Package ${PACKAGE_NAME} exists? y:0/N:1 ${package_exists}"
  return "${package_exists}"
}

create_package() {
  echo "Creating package ${PACKAGE_NAME}..."
  data="{
  \"name\": \"${PACKAGE_NAME}\",
  \"desc\": \"${PACKAGE_DESCRIPTION}\",
  \"desc_url\": \"${PACKAGE_URL}\",
  \"licenses\": [\"${PACKAGE_LICENSE}\"],
  \"vcs_url\": [\"${PACKAGE_URL}\"]
  }"

  ${CURL} -X POST -u${BINTRAY_USER}:${BINTRAY_TOKEN} -d "${data}" ${API}/packages/${BINTRAY_USER}/${BINTRAY_REPO}
}

main "$@"