docker build -t node_gyp_for_dev -f node_gyp_for_dev.Dockerfile .
docker build -t node_gyp_for_dev:8.9-alpine -f node_gyp_for_dev.Dockerfile .
docker build -t ptrn2l2/node_gyp_for_dev -f node_gyp_for_dev.Dockerfile .
docker build -t ptrn2l2/node_gyp_for_dev:8.9-alpine -f node_gyp_for_dev.Dockerfile .

docker build -t npm_gyp_for_dev -f npm_gyp_for_dev.Dockerfile .
docker build -t npm_gyp_for_dev:8.9-alpine -f npm_gyp_for_dev.Dockerfile .
docker build -t ptrn2l2/npm_gyp_for_dev -f npm_gyp_for_dev.Dockerfile .
docker build -t ptrn2l2/npm_gyp_for_dev:8.9-alpine -f npm_gyp_for_dev.Dockerfile .

docker build -t webpack_gyp_for_dev -f webpack_gyp_for_dev.Dockerfile .
docker build -t webpack_gyp_for_dev:8.9-alpine -f webpack_gyp_for_dev.Dockerfile .
docker build -t ptrn2l2/webpack_gyp_for_dev -f webpack_gyp_for_dev.Dockerfile .
docker build -t ptrn2l2/webpack_gyp_for_dev:8.9-alpine -f webpack_gyp_for_dev.Dockerfile .

docker run --rm -it --name=webpack_gyp_for_dev --entrypoint=sh -v ${pwd}:/workdir -v npm_g_for_dev_vol:/workdir/node_modules ptrn2l2/webpack_gyp_for_dev:8.9-alpine -c "pwd && ls"
