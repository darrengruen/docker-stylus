########################################################################
# hub.docker.com/r/gruen/stylus/
# Stylus task runner
#
# Usage
# docker run --it -rm \
#     -v [path/to/source/files]:/home/sytlus/inputfiles \
#     -v [path/to/build/files]:/home/stylus/outputfiles \
#     --name stylus"$(date +%N) \
#     gruen/stylus \
#     [stylus options] /home/stylus/inputfiles/[main.styl] \
#     -o /home/stylus/outputfiles/[style.css]
#
########################################################################
FROM node:10.16.3-alpine

RUN npm install -g \
  stylus@0.54.5 \
  && mkdir /home/stylus/inputfiles /home/stylus/outputfiles \
  && adduser -S stylus

USER stylus

WORKDIR /home/stylus

VOLUME ["/home/stylus/inputfiles", "/home/stylus/outputfiles"]

ENTRYPOINT ["stylus"]

CMD ["--help"]
