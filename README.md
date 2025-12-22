# JAISOCX TYPESCRIPT TOOLS BUILDER

## STATUS OF THE PROJECT

In development



## News

`Mon Dec 22 11:09:55 CET 2025`

For now in reconstruction, I appologize.

Promised to align the few preview .html pages accordingly.

The reconstruction aimed to apply for all sites tools the normal previews already available for @jaisocx/css-table,
prove and code review of base packages like css-importer where bugs were found,
review of unused numbers of hardcopies of deps installed for every package preview several times,
bugfixes in ESlint plugin for code formatting.

I dropped all examples first
and was occupied with the code review and refactoring
in order to enable somehow normal previews for packages installed to node_modules.

for now I guess most of sites tools available with yarn add or npm i remained as pair of weeks before.

1. in the bash script "./setup_Jaisocx_SitesTools.sh" fast added several calls to install node_modules for the preview after have cloned Jaisocx_SitesTools

2. TypeScript development enabled with just One single dockerized service "ts"
   where NodeJS is installed,
   along with flat http and secured https endpoints examples,
   and the Express http endpoint example for coding backend tasks in JavaScript or TypeScript both.
   The thing is, for Typescript Node docker service is needed first.
   The ts docker service allows work with http in browser having instlled just one single docker service.

3. Nevertheless, I've tested dockerized Jaisocx https endpoint, it has worked.
   On Your demand, Jaisocx docker service costs 200MB Java install in JDK Docker image and several MB Jaisocx install.




`Wed Sep 24 06:43:29 CEST 2025`

1. NO Links in `Watch In Action` examples working in the moment. Reconstruction...

2. Temporary maintenance on the preview domain `sandbox.brightday.email`.



**Updated**: Wednesday, the 24th of September 2025


[docs/md/news.md](./docs/md/news.md)



###  WARNING about "Database Lost Unattended" when runs under Docker and then Docker conf was updated.

*This Project is with a dockerized MYSQL DATABASE Instance. 
Before every git pull to update this project, 
even without checking whether Docker settings were changed, 
first do **MySQL db dump** and db dump **backup**. 
The dockerized db services sometimes 
can recreate a fresh and clean db instance, 
when some Docker config file was changed, 
and after "git pull && docker compose restart", too.*

*I leave the above warning here for good 
for js developers, first learned docker and databases.*

This ver of the Project does not rely 
on examples obtaining data from "database" docker service here. 
**No worries for now**. 
I knew once this docker option, and still work with databases.

We for sure will have here nice examples published, 
rendering data from database with our Sites Tools.





## STATUS OF THE PROJECT

In development

Updated: September 2025





**Good day.**

I appologize for oft renamings. This project is still under development in May 2025, and is not a published and developed earlier ready, tested and proved library.

Why already published: the several js tools are ready, nevertheless.




## Navigation

### A) Aim Of The Setup

[docs/md/aim_of_the_setup.md](./docs/md/aim_of_the_setup.md)



### B) Watch in Action

#### Addresses of Sites Tools Examples

[docs/md/watch_in_action.md](./docs/md/watch_in_action.md)


#### This Project Deployed on HTTPS Server

[https://sandbox.brightday.email](https://sandbox.brightday.email/)



### C) News

[docs/md/news.md](./docs/md/news.md)



### D) Features

[docs/md/features.md](./docs/md/features.md)






### E) Workarounds for sites and sites quality improvals



#### E2) Fonts like set by designer in tasks, and minimizing traffic.

[docs/md/preloader_font_loading_once.md](./docs/md/preloader_font_loading_once.md)










### E) Infrastructure How To

#### E1) Project Builder and Code Prettifier

[docs/md/howto.md](./docs/md/howto.md)


#### E2) Code prettifier lib Eslint

[docs/md/eslint.md](./docs/md/eslint.md)




### F) Webpack

[docs/md/webpack.md](./docs/md/webpack.md)



#### F1) CDN When Building A Sites Tool with Webpack

[docs/md/workaround_npm_github_webpack_cdn_explained.md](./docs/md/workaround_npm_github_webpack_cdn_explained.md)


#### F2) setup in a Javascript lib for usage later with webpack

[docs/md/enable_webpack_feature_in_a_package.md](./docs/md/enable_webpack_feature_in_a_package.md)





### G) Command Line

#### G1) Scripts in the cmd folder

[docs/md/cmd.md](./docs/md/cmd.md)



#### G2) Npm Install a Sites Tool with Preview

[docs/md/install_sites_tool_with_preview.md](./docs/md/install_sites_tool_with_preview.md)



#### G3) Debug .ts or .js scripts

[docs/md/debug_node_js.md](./docs/md/debug_node_js.md)



### H) NPM

[docs/md/npm.md](./docs/md/npm.md)



### H1) Npm index.preview.html


## Theory

### URLs

[docs/md/urls.md](./docs/md/urls.md)

### Timeline of the Protocol HTTP for Sites Browsers and Servers

[http_timeline.md](./http_timeline.md)



