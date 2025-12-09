FROM alpine:3.22.2

USER root

WORKDIR /opt/jaisocx/sites_tools/workspace/ts



### @var @local
ENV npm_installed_marker_path="/entrypoint/npm-installed.mark"



### @env docker-compose.yml
### Obtain buildtime variables from .env noted in docker-compose.yml

ARG   A_TIME_ZONE

ARG   A_GROUP_USERS_ID
ARG   A_GROUP_USERS_NAME
ARG   A_USER_ID
ARG   A_USER_NAME

ARG   A_NODE_LATEST_LTS
ARG   A_NODE_LATEST_RELEASE
ARG   A_NODE_VERSION
ARG   A_YARN_VERSION

ARG   A_PROJECT_VOLUME
ARG   A_IN_DOCKER_PROJECT_VOLUME

ARG   A_EXPRESS_PORT
ARG   A_NODE_HTTP_FLAT_PORT
ARG   A_NODE_HTTPS_PORT



### @exports
### Set runtime variables from .env noted in docker-compose.yml
### on demand decomment, then these variables are exported like after bash instruction: export variable_name

ENV TIME_ZONE="${A_TIME_ZONE}"

# ENV GROUP_USERS_ID="${A_GROUP_USERS_ID}"
ENV GROUP_USERS_NAME="${A_GROUP_USERS_NAME}"
# ENV USER_ID="${A_USER_ID}"
ENV USER_NAME="${A_USER_NAME}"

ENV NODE_LATEST_LTS="${A_NODE_LATEST_LTS}"
ENV NODE_LATEST_RELEASE="${A_NODE_LATEST_RELEASE}"

ENV NODE_VERSION="${A_NODE_VERSION}"



ENV YARN_VERSION="${A_YARN_VERSION}"

ENV PROJECT_VOLUME="${A_PROJECT_VOLUME}"
ENV IN_DOCKER_PROJECT_VOLUME="${A_IN_DOCKER_PROJECT_VOLUME}"

ENV EXPRESS_PORT="${A_EXPRESS_PORT}"
ENV NODE_HTTP_FLAT_PORT="${A_NODE_HTTP_FLAT_PORT}"
ENV NODE_HTTPS_PORT="${A_NODE_HTTPS_PORT}"



### @user @group
### @group
RUN addgroup -g "${A_GROUP_USERS_ID}" "${A_GROUP_USERS_NAME}"
### @user
RUN adduser  -u "${A_USER_ID}" -G "${A_GROUP_USERS_NAME}" -D "${A_USER_NAME}"



ENV software_namespace="jaisocx"
ENV program_name="tsvm_jsc"
ENV program_ver="1.0.1"
ENV fs_conf_of_software_path="/etc/${software_namespace}/${program_name}/V${program_ver}"
ENV fs_installed_software_path="/opt/${software_namespace}/${program_name}/V${program_ver}"
ENV fs_loaded_cache_path="/var/cache/${software_namespace}/${program_name}/V${program_ver}"

ENV TSVM_JSC_HOME="${fs_installed_software_path}"
ENV TSVM_JSC_TMP="${fs_installed_software_path}/tmp"
ENV TSVM_JSC_SYMLINKS="${fs_installed_software_path}/links"
ENV TSVM_JSC_COMMANDS="${TSVM_JSC_HOME}/commands"
ENV TSVM_JSC_INSTALLATION_SH="${TSVM_JSC_COMMANDS}/install_${program_name}.sh"
ENV TSVM_JSC_RUN_SH="${TSVM_JSC_COMMANDS}/run_${program_name}.sh"



### @install @libraries_core
RUN echo "https://dl-cdn.alpinelinux.org/alpine/v3.22/main" >> /etc/apk/repositories
RUN apk update

RUN apk add ca-certificates
RUN apk add curl
RUN apk add openssl
RUN apk add libgcc
RUN apk add libstdc++
## RUN apk add git
RUN apk add bash
# RUN apk add sudo

### RUN apk add nodejs=22.16.0-r2 npm=11.3.0-r2 pnpm=10.9.0-r2 yarn=1.22.22-r1



### @infrastructure @filesystem @privilegs_fs
RUN mkdir -p "${TSVM_JSC_HOME}"
RUN mkdir -p "${TSVM_JSC_TMP}"
RUN mkdir -p "${TSVM_JSC_SYMLINKS}"
RUN mkdir -p "${TSVM_JSC_COMMANDS}"

RUN chmod -R u+rwx "${TSVM_JSC_HOME}"
RUN chmod -R og+rx "${TSVM_JSC_HOME}"
RUN chmod -R og-w  "${TSVM_JSC_HOME}"

### RUN touch "${TSVM_JSC_INSTALLATION_SH}"
### RUN chmod u+rx "${TSVM_JSC_INSTALLATION_SH}"



### ALWAYS LINUX, SINCE ALPINE IMAGE
# ARG os="darwin"
# ARG os="linux"

# ARG cpu_architecture="loong64"
# ARG cpu_architecture="x64"
ARG cpu_architecture="arm64"



# ARG node_tarball_link="https://nodejs.org/dist/v25.0.0/node-v25.0.0-darwin-arm64.tar.gz"
# ARG node_tarball_link="https://nodejs.org/dist/v${A_NODE_VERSION}/node-v${A_NODE_VERSION}-linux-arm64.tar.xz"
# ARG node_tarball_link="https://nodejs.org/dist/v${A_NODE_VERSION}/node-v${A_NODE_VERSION}-linux-x64.tar.xz"

### https://unofficial-builds.nodejs.org/download/release/v24.11.0/node-v24.11.0-linux-x64-musl.tar.gz
### ARG node_tarball_link="https://unofficial-builds.nodejs.org/download/release/v${A_NODE_VERSION}/node-v${A_NODE_VERSION}-linux-${cpu_architecture}-musl.tar.gz"

ARG node_tarball_name="node-v${A_NODE_VERSION}-linux-${cpu_architecture}-musl"
ARG node_tarball_link="https://unofficial-builds.nodejs.org/download/release/v${A_NODE_VERSION}/${node_tarball_name}.tar.xz"
ARG node_tarball_loaded_path="${TSVM_JSC_TMP}/${node_tarball_name}.tar.xz"

RUN curl   --output-dir "${TSVM_JSC_TMP}"   -o "${node_tarball_name}.tar.xz"   "${node_tarball_link}"
RUN ls -lahrts "${node_tarball_loaded_path}"
RUN tar -xJf "${node_tarball_loaded_path}" -C "${TSVM_JSC_TMP}"

RUN ls -lahrts "${TSVM_JSC_TMP}/${node_tarball_name}"
RUN mv "${TSVM_JSC_TMP}/${node_tarball_name}"   "${TSVM_JSC_HOME}/node_v${NODE_VERSION}"
RUN rm "${node_tarball_loaded_path}"

RUN ln -sf "${TSVM_JSC_HOME}/node_v${NODE_VERSION}/lib/node_modules/npm/bin/npx-cli.js" "${TSVM_JSC_SYMLINKS}/npx"
RUN ln -sf "${TSVM_JSC_HOME}/node_v${NODE_VERSION}/lib/node_modules/npm/bin/npm-cli.js" "${TSVM_JSC_SYMLINKS}/npm"
RUN ln -sf "${TSVM_JSC_HOME}/node_v${NODE_VERSION}/lib/node_modules/corepack/dist/corepack.js" "${TSVM_JSC_SYMLINKS}/corepack"
RUN ln -sf "${TSVM_JSC_HOME}/node_v${NODE_VERSION}/bin/node" "${TSVM_JSC_SYMLINKS}/node"
### RUN ls -lahrts "${TSVM_JSC_SYMLINKS}"



### @entrypoint
RUN mkdir -p   "/entrypoint"
COPY   "./entrypoint.sh"   "/entrypoint/entrypoint.sh"
RUN chown -R   ${A_USER_ID}:${A_GROUP_USERS_ID}   "/entrypoint"
RUN chmod -R a+rwx   "/entrypoint"

### @templates @fs
ENV templates="/templates"
RUN mkdir   "${templates}"
COPY   "./templates/example.template"       "${templates}/example.template"
RUN chown -R   ${A_USER_ID}:${A_GROUP_USERS_ID}   "${templates}"
RUN chmod -R u+rx    "${templates}"
RUN chmod -R og-wx   "${templates}"

### @privilegs_fs Node install
RUN chown -R   ${A_USER_ID}:${A_GROUP_USERS_ID}   "${TSVM_JSC_HOME}"

### @privilegs_fs Volume
RUN chown -R   ${A_USER_ID}:${A_GROUP_USERS_ID}   "${A_IN_DOCKER_PROJECT_VOLUME}"
# RUN chmod -R u+rw   "${A_IN_DOCKER_PROJECT_VOLUME}"

### @mark_npm_i removes mark about npm have been installed.
###           The mark prevents npm install every time on docker restart/start
###           after first time having installed npm deps.
RUN if [ -e "${npm_installed_marker_path}" ]; then rm "${npm_installed_marker_path}"; fi



ENV NODEJS_HOME="${TSVM_JSC_HOME}/node_v${NODE_VERSION}"
ENV USER_HOME="/home/${USER_NAME}"
ENV PROFILE="${USER_HOME}/.bashrc"
RUN touch   "${PROFILE}"
RUN chown   "${USER_NAME}:${GROUP_USERS_NAME}"   "${PROFILE}"
RUN chmod   u+rwx   "${PROFILE}"



# Expose the application's port
EXPOSE 3000
# EXPOSE 80
# EXPOSE 443
EXPOSE 8085
EXPOSE 8445

# EXPOSE $A_EXPRESS_PORT
# EXPOSE $A_NODE_HTTP_FLAT_PORT
# EXPOSE $A_NODE_HTTPS_PORT



USER "${USER_NAME}"

ENTRYPOINT [ "/entrypoint/entrypoint.sh" ]


