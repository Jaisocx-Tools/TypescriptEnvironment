#!/bin/bash

GREEN="\033[0;32m"
BOLD="\033[1m"
NC="\033[0m"

echo -e "$(date): ${GREEN}Cloning repo with${NC} ${GREEN}${BOLD}Jaisocx Site Tools${NC} ${GREEN}coded in TypeScript programming language ... ${NC}"
exit 2
cd "./workspace/ts"

git clone "ssh://git@github.com/Jaisocx-Tools/Jaisocx_SitesTools.git"

cd -

echo -e "$(date): ${GREEN}Done install ${GREEN}${BOLD}Jaisocx Site Tools${NC}${GREEN}.${NC}"


