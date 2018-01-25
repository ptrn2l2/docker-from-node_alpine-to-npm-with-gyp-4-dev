rem docker image rm node_gyp_for_dev 
docker image rm node_gyp_for_dev:8.9-alpine
docker image rm ptrn2l2/node_gyp_for_dev 
docker image rm ptrn2l2/node_gyp_for_dev:8.9-alpine

docker image rm npm_gyp_for_dev
docker image rm npm_gyp_for_dev:8.9-alpine
docker image rm ptrn2l2/npm_gyp_for_dev 
docker image rm ptrn2l2/npm_gyp_for_dev:8.9-alpine

docker run --rm -it --name npm_gyp_for_dev -v ${pwd}:/workdir -v npm_g_for_dev_vol:/workdir/node_modules ptrn2l2/npm_gyp_for_dev:8.9-alpine cache verify

docker image rm webpack_gyp_for_dev 
docker image rm webpack_gyp_for_dev:8.9-alpine
docker image rm ptrn2l2/webpack_gyp_for_dev 
docker image rm ptrn2l2/webpack_gyp_for_dev:8.9-alpine
