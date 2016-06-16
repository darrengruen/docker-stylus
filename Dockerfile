########################################################################
# Stylus task runner
########################################################################

FROM alpine:3.3
MAINTAINER Darren Green <darren@gruen.site>
RUN apk --no-cache --progress --update add nodejs
RUN npm install stylus -g
RUN mkdir /inputfiles /outputfiles
VOLUME [ "/inputfiles", "/outputfiles" ]
ENTRYPOINT [ "stylus" ]
