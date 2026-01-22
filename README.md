![jaisocx.svg](cdn/www/media/images/software_labels/jaisocx.svg)

---

### Warning "Database Lost Unattended" if Docker conf was updated.

**Before** every `git pull` to **update** this project,
even without checking whether Docker settings were changed,
first do **MySQL db dump** and db dump **backup**,
since this project is with a dockerized MYSQL DATABASE Instance.



The dockerized db services sometimes
**can recreate a fresh and clean db instance**,
when some Docker config file was changed,
and after `git pull && docker compose restart`, too.

*I leave the above warning here for good
for js developers, first learned docker and databases.*

This ver of the Project does not rely
on examples obtaining data from `database` docker service here.
**No worries for now**.
I knew once this docker option, and still work with databases.

We for sure will have here nice examples published,
rendering data from database with our Sites Tools.

---





![jaisocx.svg](cdn/www/media/images/software_labels/jaisocx.svg)

> In reconstruction, not all examples do and bugfixed.

# JAISOCX™ TYPESCRIPT ENVIRONMENT®

**Sun Jan 18 13:04:58 CET 2026**



One Typescript dockerized service `ts` needed to work with NodeJS for Javascript or Typescript development under local https endpoints.

On Your demand, feel free to remove comments in `${root}/docker-compose.yml` from dockerized services confs to enable for command `docker compose start`:
1. `PHP` server side interpreting programming language,
2. `Jaisocx` Sites Server,
3. `MySQL Database`.



## News: 18th of January 2026

### 1. Wildcard SSL for domain basetasks.site

  I've purchased new domain name **basetasks.site** and wildcard SSL cert valid until end of **year 2026**.
  
  **Installed** the SSL Cert for **Jaisocx** and **Node https** with **Express**.
  


### 2. SSL Command line

  [./cmd/ssl/README.md](./cmd/ssl/README.md)



### 3. Express with https and cors

  Few js code snippets in
  [workspace/ts/express/src/secure_server.js](./workspace/ts/express/src/secure_server.js):
  1. Cors with allowed domain regexp in `.env.allow-origin`
  2. Https
  3. Json sent from local filesystem
  4. Json sent compressed
  
  

  Local link: 
  [https://local.basetasks.site:9443/](https://local.basetasks.site:9443/)





## News: 03rd of January 2026

### 1. New example page for local preview.

GitHub link:
[sites_tools/media_tools/JscImages_mini_datatypes_base/unicode.preview.html](https://github.com/Jaisocx-Tools/Jaisocx_SitesTools/tree/main/sites_tools/media_tools/JscImages_mini_datatypes_base/unicode.preview.html)

The same link on local install:
[sites_tools/media_tools/JscImages_mini_datatypes_base/unicode.preview.html](workspace/ts/Jaisocx_SitesTools/sites_tools/media_tools/JscImages_mini_datatypes_base/unicode.preview.html)



### 2. New package for command line shell
The very nice example
to invoke **in console a typescript file**,
written for a custom use of a javascript package,
installed to `node_modules`.

```bash
    ### You need custom script for package @jaisocx/css-importer
    ### Invokes in console like this:
$_ ./cmd/cssImporter.sh --debug
```

#### The documentation, linked in README.md:

**G) Command Line G1) Bash example with node debug**

GitHub link:
[console/JsInvoke/README.md](https://github.com/Jaisocx-Tools/Jaisocx_SitesTools/tree/main/console/JsInvoke/README.md)

The same link on local install: 
[console/JsInvoke/README.md](workspace/ts/Jaisocx_SitesTools/console/JsInvoke/README.md)







## News

[docs/md/news.md](./docs/md/news.md)



## A) Aim Of The Setup

[docs/md/aim_of_the_setup.md](./docs/md/aim_of_the_setup.md)



## Install

via `docker compose up -d`, but before have to:

1. **copy** `.env.example` => `.env`
2. **copy** `workspace/ts/.env.example.dynamic` => `workspace/ts/.env.dynamic`



**.env.example**

```bash

TIME_ZONE="Europe/Paris"

SOFTWARE_NAMESPACE="jaisocx"
PROGRAM_NAME="tsvm_jsc"
PROGRAM_VERSION="1.0.1"

DOMAIN_NAME="basetasks.site"
PREVIEW_DOMAIN_NAME="preview.basetasks.site"
LOCAL_DOMAIN_NAME="local.basetasks.site"

# NODE_HTTP_FLAT_PORT=80
# NODE_HTTPS_PORT=443
NODE_HTTP_FLAT_PORT=8085
NODE_HTTPS_PORT=8445
### EXPRESS_PORT is in js hardcoded
EXPRESS_SECURE_PORT=9443
EXPRESS_PORT=3000

### Force custom compatible npm ver. install
PROJECT_NODE_PACKAGE_MANAGER=npm
NODE_INSTALL_TARBALL_RELOAD=false
NPM_VER_FORCE_INSTALL=true
YARN_INSTALL=no ### temporarily does't work in this setup

NODE_VERSION="24.11.0"
NPM_VERSION="11.7.0"
YARN_VERSION="4.12.0-dev"

PROJECT_VOLUME="./workspace/ts"
IN_DOCKER_PROJECT_VOLUME="/opt/jaisocx/sites_tools/workspace/ts"
YARN_HOME="/opt/jaisocx/sites_tools/workspace/ts/build_tools/command/tsvm/yarn"

tsconfigVersion="ESNext"
tsServicePathCdn="/opt/jaisocx/sites_tools/workspace/ts/cdn"

JAISOCX_HTTP_FLAT_PORT=33223
JAISOCX_HTTPS_PORT=9445

### MySQL
MYSQL_DATABASE=db
MYSQL_USER=user
MYSQL_PASSWORD="change-this-password"
MYSQL_ROOT_PASSWORD="change-this-password"
MYSQL_PORT=3318

GROUP_USERS_ID=3425
GROUP_USERS_NAME=unpriv

GROUP_READER_ID=2752
GROUP_READER_NAME=reader

GROUP_NODE_SOFTWARE_ID=2755
GROUP_NODE_SOFTWARE_NAME=nodejs

USER_ID=2002
USER_NAME=user

USER_READER_ID=2005
USER_READER_NAME=reader

USER_NODE_ID=5351
USER_NODE_NAME=nodejs

USER_NPX_ID=5352
USER_NPX_NAME=npx

USER_NPM_ID=5353
USER_NPM_NAME=npm

USER_PNPM_ID=5354
USER_PNPM_NAME=pnpm

USER_YARN_ID=5355
USER_YARN_NAME=yarn
```

---



**.env.example.dynamic**

```bash

### workspace/ts/.env.dynamic
start_node_https=true
node_https_publish_port=8445
node_https_publish_folder="/opt/jaisocx/sites_tools/workspace/ts/Jaisocx_SitesTools"

start_node_http_flat=true
node_http_flat_publish_port=8085
node_http_flat_publish_folder="/opt/jaisocx/sites_tools/workspace/ts/Jaisocx_SitesTools"

start_express_secure=true
express_secure_publish_port=9443
express_publish_port=3000
```

---



## C) Features

[docs/md/features.md](./docs/md/features.md)



## D) Workarounds for sites and sites quality improvals



#### D2) Fonts like set by designer in tasks, and minimizing traffic.

[docs/md/preloader_font_loading_once.md](./docs/md/preloader_font_loading_once.md)








### E) Infrastructure How To

#### E1) Project Builder and Code Prettifier

[docs/md/howto.md](./docs/md/howto.md)


#### E2) Code prettifier lib Eslint

[docs/md/eslint.md](./docs/md/eslint.md)







## F) Webpack

#### F1) Webpack

[docs/md/webpack.md](./docs/md/webpack.md)



#### F2) CDN When Building A Sites Tool with Webpack

[docs/md/workaround_npm_github_webpack_cdn_explained.md](./docs/md/workaround_npm_github_webpack_cdn_explained.md)


#### F3) setup in a Javascript lib for usage later with webpack

[docs/md/enable_webpack_feature_in_a_package.md](./docs/md/enable_webpack_feature_in_a_package.md)







## G) Command Line

#### G1) Bash example with node debug


GitHub link:
[console/JsInvoke/README.md](https://github.com/Jaisocx-Tools/Jaisocx_SitesTools/tree/main/console/JsInvoke/README.md)

The same link on local install:
[console/JsInvoke/README.md](workspace/ts/Jaisocx_SitesTools/console/JsInvoke/README.md)





#### G2) Scripts in the cmd folder

[docs/md/cmd.md](./docs/md/cmd.md)



#### G3) npm install Sites Tool Preview

[docs/md/install_sites_tool_with_preview.md](./docs/md/install_sites_tool_with_preview.md)



#### G4) Debug .ts or .js scripts ( seems to be outdated, look into console/JsInvoke )

[docs/md/debug_node_js.md](./docs/md/debug_node_js.md)







## Theory


#### Arts Of Javascript

[docs/md/ArtsOfJavascript.md](./docs/md/ArtsOfJavascript.md)



#### URL ( Unified Ressource Link ) types. For Navigation and Loading on Site.

[docs/md/urls.md](./docs/md/urls.md)



#### Computer Calculations and Data Types

[docs/md/Computer_calculations_and_data_types.md](./docs/md/Computer_calculations_and_data_types.md)



#### Timeline of the Protocol HTTP for Sites Browsers and Servers

[docs/md/http_timeline.md](./docs/md/http_timeline.md)



#### npm versioning in package.json

[docs/md/npm.md](./docs/md/npm.md)



