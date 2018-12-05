<p align="center">
  <img alt="logo" src="https://hsto.org/webt/83/nk/0y/83nk0ym623xt8yit1b3pq9tj4cs.png" width="80" />
</p>

# `node` image with additional useful apps installed

[![Build][badge_automated]][link_hub]
[![Build][badge_build]][link_hub]
[![Docker Pulls][badge_pulls]][link_hub]
[![Issues][badge_issues]][link_issues]
[![License][badge_license]][link_license]

## Why this image created?

Base `node` images does not contains installed `git`, for example ([issue][node-586]).

Installed applications list:

- `git`
- `bash`
- `openssh`
- `yarn`

> Page on `hub.docker.com` can be [found here][link_hub].

Supported tags:

Tag name | Details | Full image name | Dockerfile
:------: | :-----: | :-------------: | :--------:
`latest` | ![Size][badge_size_latest] | `feugene/node` | [link][dockerfile_latest]
`alpine` | ![Size][badge_size_alpine] | `feugene/node:alpine` | [link][dockerfile_alpine]
`10-alpine` | ![Size][badge_size_10_alpine] | `feugene/node:10-alpine` | [link][dockerfile_10_alpine]
`11-alpine`  | ![Size][badge_size_11_alpine]  | `feugene/node:11-alpine`  | [link][dockerfile_11_alpine]

[badge_size_latest]:https://images.microbadger.com/badges/image/tarampampam/node.svg
[badge_size_alpine]:https://images.microbadger.com/badges/image/tarampampam/node:alpine.svg
[badge_size_10_alpine]:https://images.microbadger.com/badges/image/feugene/node:10-alpine.svg
[badge_size_11_alpine]:https://images.microbadger.com/badges/image/feugene/node:11-alpine.svg


## How can I use this?

For example:

```bash
$ docker run --rm \
    --volume "$PWD:/app" \
    --workdir "/app" \
    --user "$(id -u):$(id -g)" \
    tarampampam/node:10-alpine \
    npm install
```

Or using with `docker-compose.yml`:

```yml
services:
  node:
    image: tarampampam/node:11-alpine
    volumes:
    - ./src:/app:rw
    working_dir: /app
    command: []
```

### License

MIT. Use anywhere for your pleasure.

[badge_automated]:https://img.shields.io/docker/automated/feugene/node.svg?style=flat-square&maxAge=30
[badge_pulls]:https://img.shields.io/docker/pulls/feugene/node.svg?style=flat-square&maxAge=30
[badge_issues]:https://img.shields.io/github/issues/efureev/node-docker.svg?style=flat-square&maxAge=30
[badge_build]:https://img.shields.io/docker/build/feugene/node.svg?style=flat-square&maxAge=30
[badge_license]:https://img.shields.io/github/license/efureev/node-docker.svg?style=flat-square&maxAge=30
[node-586]:https://github.com/nodejs/docker-node/issues/586
[link_hub]:https://hub.docker.com/r/feugene/node/
[link_license]:https://github.com/efureev/node-docker/blob/master/LICENSE
[link_issues]:https://github.com/efureev/node-docker/issues
