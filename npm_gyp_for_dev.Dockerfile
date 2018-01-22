FROM ptrn2l2/node_gyp_for_dev:8.9-alpine

EXPOSE 80 443

ENTRYPOINT ["npm"]
CMD ["-v"]
