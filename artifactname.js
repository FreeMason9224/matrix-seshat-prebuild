
let pk = require(process.cwd()+'/package.json')
let path = require('path')

console.log(
   path.basename(require(process.cwd()+'/node_modules/prebuild-install/util').getDownloadUrl(
      Object.assign({}, require(process.cwd()+'/node_modules/prebuild-install/rc')(pk), {pkg: pk})
)));
