FROM ptrn2l2/npm_gyp_for_dev:8.9-alpine

RUN npm -g config set user root
RUN npm install -g webpack webpack-dev-server

# expose port in webpack.config
ENV WEBPACK_DEV_SERVER_PORT 44297
ENV WEBPACKCONFIG webpack.config.js

EXPOSE 80 443 3000 44297

# For local webpack-dev-server installs: 
# ENTRYPOINT ["node.exe"]
# CMD ["./node_modules/webpack-dev-server/bin/webpack-dev-server.js","--display-error-details","--watch-poll","--progress","-d","--colors","--port","44299","--config","./webpack.config.debug.js","--https"]
# here is global:
ENTRYPOINT ["webpack-dev-server"]
CMD ["--config","$WEBPACKCONFIG","--display-error-details","--watch-poll","--progress", "-d","--colors","--port","$WEBPACK_DEV_SERVER_PORT","--https"]

#webpack-dev-server --config $WEBPACKCONFIG --display-error-details --watch-poll --progress -d --colors --port $WEBPACK_DEV_SERVER_PORT --https