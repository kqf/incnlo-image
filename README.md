INCNLO Image [![Build Status](https://travis-ci.com/kqf/incnlo-image.svg?branch=master)](https://travis-ci.com/kqf/incnlo-image) ![Docker Pulls](https://img.shields.io/docker/pulls/akqf/incnlo)
---------------

The base image for direct photon and inclusive hadron production estimation software (INCNLO). It uses quite old versions of libraries therefore it should run inside isolated environment.

## Usage
Put the configuration file in the desired directory, set the first parameter in `param.dat` to `/output/` and then run

```
docker run --rm -v ${PWD}:/output/ akqf/incnlo inclnll
```
