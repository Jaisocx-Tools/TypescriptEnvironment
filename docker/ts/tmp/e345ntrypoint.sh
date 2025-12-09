#!/bin/bash

### tried both /bin/bash and /usr/bin/env bash,
### and with this way of the adding users and user groups and Linux libraries install
### easier for now just /bin/bash
### and maybe I shall modify the Dockerfile in order to set
### the best way to note the shell with /usr/bin/env bash later.

nvm_path="${NVM_DIR}/versions/node/v${NODE_VERSION}"
u_home="/home/${USER_NAME}"


### to load .env.tmp
set -e

### @privilegs_fs
#chown -R ${USER_NAME}:${GROUP_USERS_NAME}   "${NVM_DIR}"
#chmod -R a+rx   "${NVM_DIR}"

[ -s "${NVM_DIR}/nvm.sh" ] && . "${NVM_DIR}/nvm.sh"
nvm uninstall "${NODE_VERSION}"
nvm install "${NODE_VERSION}" --latest-npm  --arch=arm64  --no-binary  --save
nvm alias   default   "${NODE_VERSION}"
nvm use default


chown -R   ${USER_NAME}:${GROUP_USERS_NAME}   "${NVM_DIR}/current"
chown -R   ${USER_NAME}:${GROUP_USERS_NAME}   "${NVM_DIR}/versions"



if [ -e "${u_home}/.bash_profile" ]; then
  rm "${u_home}/.bash_profile"
fi

touch "${u_home}/.bash_profile"
# echo -e "#!/usr/bin/env bash\n\n  export NVM_DIR=\"${NVM_DIR}\"\n  [ -s \"\${NVM_DIR}/nvm.sh\" ] && . \"\${NVM_DIR}/nvm.sh\"\n  [ -s \"\${NVM_DIR}/bash_completion\" ] && \. \"\${NVM_DIR}/bash_completion\"\n\n" >> "${u_home}/.bash_profile"
echo -e "#!/usr/bin/env bash"                             >> "${u_home}/.bash_profile"
echo -e "\n" >> "${u_home}/.bash_profile"

echo -e "export PATH=\"${node_symlinks_home}:${PATH}\""   >> "${u_home}/.bash_profile"
echo -e "\n" >> "${u_home}/.bash_profile"

echo -e "export NVM_DIR=\"${NVM_DIR}\""                   >> "${u_home}/.bash_profile"
echo -e "\n" >> "${u_home}/.bash_profile"

cat "${templates}/nvm_load_profile.template"              >> "${u_home}/.bash_profile"
echo -e "\n" >> "${u_home}/.bash_profile"

cat "${templates}/alias_profile.template"                 >> "${u_home}/.bash_profile"
echo -e "\n\n" >> "${u_home}/.bash_profile"

chown   ${USER_NAME}:${GROUP_USERS_NAME}   "${u_home}/.bash_profile"
chmod   u+x   "${u_home}/.bash_profile"
cat "${u_home}/.bash_profile"



loc_folder="${NVM_DIR}"
echo "ls ${loc_folder}"
ls -lahrtsi "${loc_folder}"

loc_folder="${NVM_DIR}/alias"
echo "ls ${loc_folder}"
ls -lahrtsi "${loc_folder}"

loc_folder="${NVM_DIR}/versions"
echo "ls ${loc_folder}"
ls -lahrtsi "${loc_folder}"

loc_folder="${NVM_DIR}/versions/node"
echo "ls ${loc_folder}"
ls -lahrtsi "${loc_folder}"

loc_folder="${NVM_DIR}/versions/node/v${NODE_VERSION}"
echo "ls ${loc_folder}"
ls -lahrtsi "${loc_folder}"

loc_folder="${NVM_DIR}/versions/node/v${NODE_VERSION}/bin"
echo "ls ${loc_folder}"
ls -lahrtsi "${loc_folder}"



loc_folder="/home"
echo "ls ${loc_folder}"
ls -lahrtsi "${loc_folder}"

loc_folder="${u_home}"
echo "ls ${loc_folder}"
ls -lahrtsi "${loc_folder}"

#loc_folder="/root"
#echo "ls ${loc_folder}"
#ls -lahrtsi "${loc_folder}"

loc_folder="/usr/local"
echo "ls ${loc_folder}"
ls -lahrtsi "${loc_folder}"

loc_folder="/usr/local/bin"
echo "ls ${loc_folder}"
ls -lahrtsi "${loc_folder}"



ln -vsf   "${nvm_path}/bin/node"   "${node_symlinks_home}/node"
ln -vsf   "${nvm_path}/bin/npm"    "${node_symlinks_home}/npm"
ln -vsf   "${nvm_path}/bin/npx"    "${node_symlinks_home}/npx"

##### @privilegs_fs
chown -R ${USER_NAME}:${GROUP_USERS_NAME}   "${node_symlinks_home}"
#chown ${USER_NAME}:${GROUP_USERS_NAME}   "${node_symlinks_home}/node"
chown ${USER_NAME}:${GROUP_USERS_NAME}   "${node_symlinks_home}/npm"
chown ${USER_NAME}:${GROUP_USERS_NAME}   "${node_symlinks_home}/npx"

##### @privilegs_fs
#### @task: to prove with o-rwx ug+rx
chmod -R a+rx   "${node_symlinks_home}"
# chmod a+rx   "${node_symlinks_home}/node"
chmod a+rx   "${node_symlinks_home}/npm"
chmod a+rx   "${node_symlinks_home}/npx"



### @tasK delete this temp code line
ls -lahrtsi "${node_symlinks_home}"



echo "/usr/local/nvm/v0.39.5/nvm-exec"
cat "/usr/local/nvm/v0.39.5/nvm-exec"

echo -e "u_home=\"${u_home}\"\n\n" > "./.env.local.temp"
sudo -u ${USER_NAME} bash <<EOF

    set -e

    source "./.env.local.temp"

    whoami
    pwd

    source "${u_home}/.bash_profile"
    ### nvm install-latest-npm

    nvm -v
    node -v
    npm -v

EOF



### @privilegs_fs
if [ ! -e "${npm_installed_marker_path}" ]; then
    chown -R ${USER_NAME}:${GROUP_USERS_NAME}   "${MAPPED_PATH_IN_VOLUME}"
    chmod -R ug+rw   "${MAPPED_PATH_IN_VOLUME}"
fi



### @install typescript and other
if [ ! -e "${npm_installed_marker_path}" ]; then
    # sudo -u ${USER_NAME}   npm install
    npm install
fi



### @install express
if [ ! -e "${npm_installed_marker_path}" ]; then
    cd "${MAPPED_PATH_IN_VOLUME}/express"
    # sudo -u ${USER_NAME}   npm install
    npm install
fi



if [ ! -e "${npm_installed_marker_path}" ]; then
    # sudo -u ${USER_NAME}   touch "${npm_installed_marker_path}"
    touch "${npm_installed_marker_path}"
fi

# . "${NVM_DIR}/nvm.sh"



### @start_services
#cd "${MAPPED_PATH_IN_VOLUME}/express"
#npm express &  # @explained &: Start in background every process to be able to start also other processes, every with the ampersand sing

#cd "${MAPPED_PATH_IN_VOLUME}"
#npm https &    # @explained &: Start in background every process to be able to start also other processes, every with the ampersand sing
npm http_flat  # @explained without &: Starts and holds dockerized service working


