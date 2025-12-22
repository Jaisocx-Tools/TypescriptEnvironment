#!/bin/bash

GREEN="\033[0;32m"
BOLD="\033[1m"
NC="\033[0m"

echo -e "$(date): ${GREEN}On line 8 encomment temp exit instruction after this echo. New docker setup started..., Cloning repo with${NC} ${GREEN}${BOLD}Jaisocx Site Tools${NC} ${GREEN}coded in TypeScript programming language ... ${NC}"
exit 2



cd "./workspace/ts"

git clone "ssh://git@github.com/Jaisocx-Tools/Jaisocx_SitesTools.git"

cd -

docker compose build
docker compose up ts -d

docker compose start

cp "./.env.example" "./.env"

set -e
. "./.env"



### the temporary fast-n-dirty to install npm deps for preview after have cloned SitesTools typescript code

packagePath="Jaisocx_SitesTools"
commandToRun="cd "${IN_DOCKER_PROJECT_VOLUME}/${packagePath}" && npm install -S  --install-strategy=hoisted  --include=optional "
docker compose exec ts bash -c ". "/home/${USER_NAME}/.bashrc" && ${commandToRun}"

packagePath="Jaisocx_SitesTools/sites_tools/css_tools/CssCleanStart_2"
commandToRun="cd "${IN_DOCKER_PROJECT_VOLUME}/${packagePath}" && npm install -S  --install-strategy=hoisted  --include=optional "
docker compose exec ts bash -c ". "/home/${USER_NAME}/.bashrc" && ${commandToRun}"

packagePath="Jaisocx_SitesTools/sites_tools/css_tools/css_flat/CssCodeSnippet"
commandToRun="cd "${IN_DOCKER_PROJECT_VOLUME}/${packagePath}" && npm install -S  --install-strategy=hoisted  --include=optional "
docker compose exec ts bash -c ". "/home/${USER_NAME}/.bashrc" && ${commandToRun}"

packagePath="Jaisocx_SitesTools/sites_tools/css_tools/css_flat/CssTable"
commandToRun="cd "${IN_DOCKER_PROJECT_VOLUME}/${packagePath}" && npm install -S  --install-strategy=hoisted  --include=optional "
docker compose exec ts bash -c ". "/home/${USER_NAME}/.bashrc" && ${commandToRun}"

packagePath="Jaisocx_SitesTools/sites_tools/css_tools/CssToolTemplate"
commandToRun="cd "${IN_DOCKER_PROJECT_VOLUME}/${packagePath}" && npm install -S  --install-strategy=hoisted  --include=optional "
docker compose exec ts bash -c ". "/home/${USER_NAME}/.bashrc" && ${commandToRun}"

packagePath="Jaisocx_SitesTools/sites_tools/media_tools/JscFonts_base"
commandToRun="cd "${IN_DOCKER_PROJECT_VOLUME}/${packagePath}" && npm install -S  --install-strategy=hoisted  --include=optional "
docker compose exec ts bash -c ". "/home/${USER_NAME}/.bashrc" && ${commandToRun}"

packagePath="Jaisocx_SitesTools/sites_tools/media_tools/JscFonts_Orbitron"
commandToRun="cd "${IN_DOCKER_PROJECT_VOLUME}/${packagePath}" && npm install -S  --install-strategy=hoisted  --include=optional "
docker compose exec ts bash -c ". "/home/${USER_NAME}/.bashrc" && ${commandToRun}"

packagePath="Jaisocx_SitesTools/sites_tools/media_tools/JscImages_mini_datatypes_base"
commandToRun="cd "${IN_DOCKER_PROJECT_VOLUME}/${packagePath}" && npm install -S  --install-strategy=hoisted  --include=optional "
docker compose exec ts bash -c ". "/home/${USER_NAME}/.bashrc" && ${commandToRun}"

packagePath="Jaisocx_SitesTools/sites_tools/media_tools/JscImages_mini_freepic_kawaii"
commandToRun="cd "${IN_DOCKER_PROJECT_VOLUME}/${packagePath}" && npm install -S  --install-strategy=hoisted  --include=optional "
docker compose exec ts bash -c ". "/home/${USER_NAME}/.bashrc" && ${commandToRun}"

packagePath="Jaisocx_SitesTools/sites_tools/media_tools/JscImages_mini_mimetypes_base"
commandToRun="cd "${IN_DOCKER_PROJECT_VOLUME}/${packagePath}" && npm install -S  --install-strategy=hoisted  --include=optional "
docker compose exec ts bash -c ". "/home/${USER_NAME}/.bashrc" && ${commandToRun}"

packagePath="Jaisocx_SitesTools/sites_tools/js_tools/CssTableOrdered"
commandToRun="cd "${IN_DOCKER_PROJECT_VOLUME}/${packagePath}" && npm install -S  --install-strategy=hoisted  --include=optional "
docker compose exec ts bash -c ". "/home/${USER_NAME}/.bashrc" && ${commandToRun}"

packagePath="Jaisocx_SitesTools/sites_tools/js_tools/EmailHtmlInliner"
commandToRun="cd "${IN_DOCKER_PROJECT_VOLUME}/${packagePath}" && npm install -S  --install-strategy=hoisted  --include=optional "
docker compose exec ts bash -c ". "/home/${USER_NAME}/.bashrc" && ${commandToRun}"

packagePath="Jaisocx_SitesTools/sites_tools/js_tools/Tree"
commandToRun="cd "${IN_DOCKER_PROJECT_VOLUME}/${packagePath}" && npm install -S  --install-strategy=hoisted  --include=optional "
docker compose exec ts bash -c ". "/home/${USER_NAME}/.bashrc" && ${commandToRun}"



echo -e "$(date): ${GREEN}Done install ${GREEN}${BOLD}Jaisocx Site Tools${NC}${GREEN}.${NC}"


