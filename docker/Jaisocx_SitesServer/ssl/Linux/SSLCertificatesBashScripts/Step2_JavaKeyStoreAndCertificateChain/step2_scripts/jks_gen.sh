#!/usr/bin/env bash



# Specify the source directory path.
CERT_FOLDER="/Users/illiapolianskyi/Projects/Projects2025/Java/Servers/jaisocx-http/ssl/Linux/JaisocxWildcard2025_2026"
FOLDER_OBTAINED_CERTIFICATES="${CERT_FOLDER}/STAR_jaisocx_com"

# Specify the target directory path.
FOLDER_PRODUCED_JKS="${CERT_FOLDER}/produced_jks"



### HERE GO SRCS TO YOUR CERT FILES FROM CERTIFICATION AUTHORITY

# Specify a private key file path.
PRIVATE_KEY="${CERT_FOLDER}/jaisocx.com.key"



RootCACertificate="${FOLDER_OBTAINED_CERTIFICATES}/USERTrustRSACertificationAuthority.crt"
IntermediateCACertificat="${FOLDER_OBTAINED_CERTIFICATES}/SectigoPublicServerAuthenticationRootR46_USERTrust.crt"
IntermediateCA2Certificate="${FOLDER_OBTAINED_CERTIFICATES}/SSL2BUYEMEARSADomainValidationSecureServerCA.crt"
ClickSSLDVWildcardCertificate="${FOLDER_OBTAINED_CERTIFICATES}/STAR_jaisocx_com.crt"



### HERE GO YOUR OUTPUT JKS PARAMS
# Keystore JKS alias.
JKS_ALIAS="jaisocx.com"

# Specify the keystore password which is used to protect the integrity of the keystore.
# Keystore password must be at least 6 characters.
JKS_PASSWORD=nfLN7sJ3wnadSLueRoaeQCmu9UV33XDnKvCr29hbMkHbET4CPCUPK4pfccyM



# Specify the keystore file path.
JKS_FILE="${FOLDER_PRODUCED_JKS}/jaisocx.com.jks"



###=============================================================
### DON'T EDIT BELOW
###=============================================================

# chain CA.

JAISOCX_CHAIN="${FOLDER_PRODUCED_JKS}/jaisocx_chain.crt"

# PKCS12 file path.
PKCS_FILE="${FOLDER_PRODUCED_JKS}/jaisocx_keystore.p12"

# PKCS12 name.
PKCS12_NAME="${JKS_ALIAS}"



# PKCS12 password.
PKCS12_PASSWORD=eDp2TNccaQ4TrL9MhWN7hENSmFcYD2QAMYUVcSdWCScaHF7MtJRLRLmoPJ3r



# =================================================================================================
# Create trusted CA chain of certificates. Create PKCS12 keystore from CA chain of certificates.


if [[ -e "${JAISOCX_CHAIN}" ]]; then
  rm "${JAISOCX_CHAIN}"
fi

certificates=(
  "RootCACertificate"
  "IntermediateCACertificat"
  "IntermediateCA2Certificate"
  "ClickSSLDVWildcardCertificate"
)

for cert in "${certificates[@]}"; do

  echo "${cert}"
  cat "${!cert}" >> "${JAISOCX_CHAIN}"

done;



openssl pkcs12 -export -name "${PKCS12_NAME}" -in "${JAISOCX_CHAIN}" -inkey "${PRIVATE_KEY}" \
 -passout pass:$PKCS12_PASSWORD -out "$PKCS_FILE"

# =================================================================================================

# Convert PKCS12 keystore into a JKS keystore.
keytool -importkeystore -destkeystore "$JKS_FILE" -srckeystore "$PKCS_FILE" -srcstoretype pkcs12 \
-srcstorepass $PKCS12_PASSWORD -alias $JKS_ALIAS -storepass $JKS_PASSWORD

# Delete temporary PKCS12 file
# rm "$PKCS_FILE"

# Delete temporary CA chain file
# rm "$CHAIN_CA"


