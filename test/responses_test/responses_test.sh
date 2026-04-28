#!/bin/bash

script="$(realpath "$0")"
folder="$(realpath "$(dirname "${script}")")"



set -a
. "${folder}/.env"



overloc_env_test_port="${env_test_port}"
overloc_env_test_domain="${env_test_domain}"
overloc_env_test_start="${env_test_start}"
overloc_env_links_published="${env_links_published}"



loc_proto="https"
const_http_standard_port="80"
const_https_standard_port="443"

loc_test_standard_port="${const_https_standard_port}"

if [[ "${env_is_secure}" == "true" ]]; then
    loc_proto="https"
    loc_test_standard_port="${const_https_standard_port}"
  else
    loc_proto="http"
    loc_test_standard_port="${const_http_standard_port}"
fi

if [[ -z "${env_test_port}" ]]; then
    overloc_env_test_port="${loc_test_standard_port}"
fi

if [[ "${overloc_env_test_port}" == "${loc_test_standard_port}" ]]; then
    loc_test_address="${loc_proto}://${overloc_env_test_domain}${overloc_env_test_start}"
  else
    loc_test_address="${loc_proto}://${overloc_env_test_domain}:${overloc_env_test_port}${overloc_env_test_start}"
fi



IFS="\n"

loc_link="${loc_test_address}"

for link in "${overloc_env_links_published}"; do

  loc_link="${loc_test_address}${link}"
  echo -e "requesting: ${loc_link}\n"

  curl -i "${loc_link}";

done;


