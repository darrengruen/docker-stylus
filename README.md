# Stylus

Stylus task runner


## Usage

```
docker run -it --rm \
    -v [path/to/source/dir]:/inputfiles \
    -v [path/to/build/dir]:/outputfiles \
    gruen/stylus \
    [options] /inputfiles/[main].styl \
    -o /outputfiles/[buildname].css
```

For example, if you want to use watch

```
docker run -it --rm \
    -v [path/to/source/dir]:/inputfiles \
    -v [path/to/build/dir]:/outputfiles \
    gruen/stylus \
    -w /inputfiles/[main].styl \
    -o /outputfiles/[buildname].css
```

For available options run

```
docker run -it --rm gruen/stylus --help
```

### References

[Stylus GitHub](https://github.com/stylus/stylus/)

[Stylus website](http://stylus-lang.com/)

#### Issues
- Process doesn't seem to want to terminate... ```ctrl+c```, ```docker stop [stylus container]```, Neither seem to work. Only luck has been with ```docker kill [stylus container]```
