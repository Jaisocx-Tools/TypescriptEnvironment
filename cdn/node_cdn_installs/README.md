# node_cdn_installs

  Just like example for placing `package.json` to **install to node_modules** in **deploy** time.
  
  Both `package.json` and `-lock.json` are gitignored,
  and this is a nice solution for deploys with **git**, **npm** or **yarn**.
  
  **.gitignore**
  
  ```sh
    /cdn/node_cdn_installs/package.json
    /cdn/node_cdn_installs/package-lock.json
    /cdn/node_cdn_installs/yarn.lock
  ```



