#!/bin/bash

### tried both /bin/bash and /usr/bin/env bash,
### and with this way of the adding users and user groups and Linux libraries install
### easier for now just /bin/bash
### and maybe I shall modify the Dockerfile in order to set
### the best way to note the shell with /usr/bin/env bash later.

# USER_HOME="/home/${USER_NAME}"
# NODEJS_HOME="${TSVM_JSC_HOME}/node_v${NODE_VERSION}"
templates="/templates"



### set -e to load .env.tmp
set -e


### preview of installed node
loc_folder="${NODEJS_HOME}"
echo "ls ${loc_folder}"
ls -lahrtsi "${loc_folder}"

loc_folder="${NODEJS_HOME}/bin"
echo "ls ${loc_folder}"
ls -lahrtsi "${loc_folder}"

loc_folder="${TSVM_JSC_SYMLINKS}"
echo "ls ${loc_folder}"
ls -lahrtsi "${loc_folder}"



### Node adds to PATH
echo "export"
export PATH="${TSVM_JSC_SYMLINKS}:${PATH}"

### Preview CPU Architecture Alpine Docker Service built with
echo "uname -m"
uname -m

### Preview CPU Architecture node built with
echo "ldd"
ldd "${TSVM_JSC_SYMLINKS}/node"

echo "ls -l"
ls -l "${TSVM_JSC_SYMLINKS}/node"



### BASH PROFILE FOR USER
#### the first line to the text variable with bash profile
shell_declaration_line="#!/bin/bash"
bash_login_content="${shell_declaration_line}\n"

#### exports PATH to the text variable with bash profile
profile_path_export_line="export PATH=\"${TSVM_JSC_SYMLINKS}:${PATH}\""
bash_login_content="${bash_login_content}\n${profile_path_export_line}\n"

USER_HOME="/home/${USER_NAME}"
profile_path_export_line="export USER_HOME=\"${USER_HOME}\""
bash_login_content="${bash_login_content}\n${profile_path_export_line}\n"

PROFILE="${USER_HOME}/.bashrc"
profile_path_export_line="export PROFILE=\"${PROFILE}\""
bash_login_content="${bash_login_content}\n${profile_path_export_line}\n"

NODEJS_HOME="${TSVM_JSC_HOME}/node_v${NODE_VERSION}"
profile_path_export_line="export NODEJS_HOME=\"${NODEJS_HOME}\""
bash_login_content="${bash_login_content}\n${profile_path_export_line}\n"

### cat "${templates}/example.template"                 >> "${USER_HOME}/.bash_login"
#### reads a template for bash profile, and adds to the text variable with bash profile
start_comment_line_example_template_profile="### example.template"
example_template_profile="$(cat "${templates}/example.template")"
bash_login_content="${bash_login_content}\n\n\n${start_comment_line_example_template_profile}\n${example_template_profile}\n\n"

#### writes bash profile to the user's home dir
# PROFILE="${USER_HOME}/.bashrc"
echo    -e "${bash_login_content}" > "${PROFILE}"
# cat     "${PROFILE}"
. "${PROFILE}"



. "${IN_DOCKER_PROJECT_VOLUME}/.env.dynamic"

### @install typescript and other
# sudo -u ${USER_NAME}   npm install
if [ ! -e "${npm_installed_marker_path}" ]; then
    npm install
fi

### @install express
cd "${IN_DOCKER_PROJECT_VOLUME}/express"
if [ ! -e "${npm_installed_marker_path}" ]; then
    npm install
fi

if [ ! -e "${npm_installed_marker_path}" ]; then
    touch "${npm_installed_marker_path}"
fi



### @start_services
export NODE_HTTP_FLAT_PORT
export NODE_HTTPS_PORT

export node_https_publish_port
export node_http_flat_publish_port

export node_https_publish_folder
export node_http_flat_publish_folder

if [[ "${start_node_https}" == "true" ]]; then
  npm --prefix "${IN_DOCKER_PROJECT_VOLUME}" run https &      # @explained &: Start in background every process to be able to start also other processes, every with the ampersand sing
fi

if [[ "${start_node_http_flat}" == "true" ]]; then
  npm --prefix "${IN_DOCKER_PROJECT_VOLUME}" run http_flat &  # @explained without &: Starts and holds dockerized service working
fi

npm --prefix "${IN_DOCKER_PROJECT_VOLUME}/express" run start  # @explained &: Start in background every process to be able to start also other processes, every with the ampersand sing


