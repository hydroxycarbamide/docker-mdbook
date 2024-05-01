ARG BASE_IMAGE

FROM rust:alpine AS builder

RUN apk add --no-cache musl-dev
ENV ARC="x86_64-unknown-linux-musl"
RUN rustup target add "${ARC}"
ARG MDBOOK_VERSION
RUN cargo install mdbook --version "${MDBOOK_VERSION}" --target "${ARC}"
ARG MDBOOK_CATPPUCCIN_VERSION
RUN cargo install mdbook-catppuccin --version "${MDBOOK_CATPPUCCIN_VERSION}" --target "${ARC}"

FROM $BASE_IMAGE

SHELL ["/bin/ash", "-eo", "pipefail", "-c"]
COPY --from=builder /usr/local/cargo/bin/mdbook /usr/bin/mdbook
COPY --from=builder /usr/local/cargo/bin/mdbook-catppuccin /usr/bin/mdbook-catppuccin

WORKDIR /book
ENTRYPOINT [ "/usr/bin/mdbook" ]


