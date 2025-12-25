#!/usr/bin/env bash

# Define your domain name
DOMAIN="brightday.email"

# Generate a private key
openssl genpkey -algorithm RSA -out "${DOMAIN}.key" -pkeyopt rsa_keygen_bits:2048

# Generate a CSR for a wildcard certificate
openssl req -new -key "${DOMAIN}.key" -out "${DOMAIN}.csr" -subj "/C=CH/ST=ZH/L=Zurich/O=Polianskyi_Jaisocx/OU=IT/CN=*.${DOMAIN}"

