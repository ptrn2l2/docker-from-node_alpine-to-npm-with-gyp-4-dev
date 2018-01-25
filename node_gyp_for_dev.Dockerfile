FROM node:8.9-alpine

# ##################################################
# TODO: add non root user Alpine way!
#            also note that in linux the
#            local's user uid must be the same 
#            as the user added in the Dockerfile!
#            for now I will set
#                "npm -g config set user root"
# ##################################################
#
# ##################################################
# Complete NPM on alpine (npm-gyp support)
# without caring for image size:
# I need python 2 && c++ available 
# to install npm modules
# that need node-gyp 
# so no "--virtual" nor "--no-cache" here!
# ##################################################

# ##################################################
RUN apk update && apk upgrade && \
    apk add ca-certificates && \
    apk add gcc g++ libstdc++ libgcc \
            binutils-gold curl gnupg \
            linux-headers make build-base \
            libc6-compat && \
    apk add git && \
    apk add python2 python2-dev py2-pip
#
# another things that could be added is
#     pip install --upgrade pip
#     
# ##################################################

# ##################################################
# NOTE: to override NODE_ENV use  on command line :
#      -e "NODE_ENV=development"
ENV NODE_ENV=production
ENV PATH="${PATH}:$NPM_CONFIG_PREFIX"
# some best practice says to change npm global folder:
#   NPM_CONFIG_PREFIX=/home/node/glob_node_modules
# NOTE: if you di it, you will have 2 npm, one 
#       in "/usr/local/lib/", the other in "$NPM_CONFIG_PREFIX"
RUN npm -g config set user root
RUN npm install -g npm
RUN npm install -g node-gyp
# ##################################################

# ##################################################
RUN mkdir /workdir && cd /workdir
WORKDIR /workdir
ENV PATH /workdir/node_modules/.bin:$PATH
# Here in production one should do:
#     COPY package.json .
#     RUN npm install
#     COPY . .
EXPOSE 80 443
ENTRYPOINT ["node"]
CMD ["-v"]
# ##################################################
