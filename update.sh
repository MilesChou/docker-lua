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

VERSIONS="
5.1.5
5.2.4
5.3.6
5.4.4
"

for version in ${VERSIONS}; do
    major_version=$(echo ${version} | cut -d. -f1)
    minor_version=$(echo ${version} | cut -d. -f2)

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

JIT_VERSIONS="
2.0.5
2.1.0-beta3
"

for version in ${JIT_VERSIONS}; do
    major_version=$(echo ${version} | cut -d. -f1)
    minor_version=$(echo ${version} | cut -d. -f2)

    main_version=jit-"${major_version}.${minor_version}"

    rm -rf ${main_version}
    mkdir -p ${main_version}
    mkdir -p ${main_version}/alpine

    generated_warning > ${main_version}/alpine/Dockerfile
    cat Dockerfile-jit-alpine.template | \
        sed -e 's!%%LUAJIT_VERSION%%!'"${version}"'!' \
        >> ${main_version}/alpine/Dockerfile

    generated_warning > ${main_version}/Dockerfile
    cat Dockerfile-jit.template | \
        sed -e 's!%%LUAJIT_VERSION%%!'"${version}"'!' \
        >> ${main_version}/Dockerfile
done
