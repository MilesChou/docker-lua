#!/usr/bin/env bash

generated_warning() {
	cat <<-EOH
		#
		# NOTE: THIS DOCKERFILE IS GENERATED VIA "update.sh"
		#
		# PLEASE DO NOT EDIT IT DIRECTLY.
		#
	EOH
}

LATEST_VERSION=7.3

VERSIONS="
5.1.5
5.2.4
5.3.5
"

for version in ${VERSIONS}; do
    major_version=$(echo ${version} | cut -f1 -d.)
    minor_version=$(echo ${version} | cut -f2 -d.)

    main_version="${major_version}.${minor_version}"

    rm -rf ${main_version}
    mkdir -p ${main_version}
    mkdir -p ${main_version}/alpine

    generated_warning > ${main_version}/alpine/Dockerfile
    cat Dockerfile-alpine.template | \
        sed -e 's!%%LUA_VERSION%%!'"${version}"'!' \
        >> ${main_version}/alpine/Dockerfile

    generated_warning > ${main_version}/Dockerfile
    cat Dockerfile.template | \
        sed -e 's!%%LUA_VERSION%%!'"${version}"'!' \
        >> ${main_version}/Dockerfile
done
