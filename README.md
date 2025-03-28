<!-- https://shields.io/ -->

[![license](https://img.shields.io/github/license/hydroxycarbamide/docker-mdbook.svg)](https://github.com/hydroxycarbamide/docker-mdbook/blob/main/LICENSE)
[![GitHub Actions status](https://github.com/Hydroxycarbamide/docker-mdbook/actions/workflows/ci.yml/badge.svg)](https://github.com/Hydroxycarbamide/docker-mdbook/actions/workflows/ci.yml)

<img width="400" alt="Docker image for mdBook" src="./images/ogp.jpg">



# Alpine Base Docker Image for [rust-lang/mdBook]

Alpine base Docker Image for [rust-lang/mdBook].

[rust-lang/mdBook]: https://github.com/rust-lang/mdBook


## Getting started

| Image tag | Base Image | Image size | Notes |
|---|---|---|---|
| `ghcr.io/hydroxycarbamide/mdbook:alpine` | `alpine:latest` | 29.3MB | GitHub Packages: Minimum image |
| `ghcr.io/hydroxycarbamide/mdbook:rust-alpine` | `rust:alpine` | 812MB | GitHub Packages: `mdbook test` subcommand is available |

### Docker Compose

Create your `docker-compose.yml` like the following.

```yaml
version: '3'

services:
  mdbook:
    container_name: mdbook
    image: ghcr.io/hydroxycarbamide/mdbook:alpine    # Minimum image
    # image: hydroxycarbamide/mdbook:rust-alpine     # `mdbook test` subcommand is available
    stdin_open: true
    tty: true
    ports:
      - 3000:3000
      - 3001:3001
    volumes:
      - ${PWD}:/book
    command:
      - serve
      - --hostname
      - '0.0.0.0'
```

### Usage

```sh
# Run "mdbook serve"
docker-compose up

# Run a command of mdBook
docker-compose run --rm mdbook init
```



## GitHub Actions for mdBook

The mdBook Setup GitHub Action is recommended.

- [peaceiris/actions-mdbook: GitHub Actions for mdBook (rust-lang/mdBook) ⚡️ Setup mdBook quickly and build your site fast. Linux (Ubuntu), macOS, and Windows are supported.](https://github.com/peaceiris/actions-mdbook)



## License

- [MIT License - peaceiris/docker-mdbook]

[MIT License - peaceiris/docker-mdbook]: https://github.com/hydroxycarbamide/docker-mdbook/blob/main/LICENSE



## About the author

- [peaceiris homepage](https://peaceiris.com/)
