# Stylus

Stylus task runner

## Usage

```
docker run -it --rm \
    -v [path/to/source/dir]:/inputfiles \
    -v [path/to/build/dir]:/outputfiles \
    gruen/stylus \
    [-w] [-c] [-U] /inputfiles/[main].styl \
    [-o] /outputfiles/[buildname].css
```
