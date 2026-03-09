FROM alpine:3.23

RUN apk add --no-cache opam git bash gmp-dev pkgconf libffi-dev openssl-dev zlib-dev linux-headers gcc musl-dev make

RUN opam init --disable-sandboxing --bare -y
RUN opam switch create 5.2 ocaml-base-compiler.5.2.1
RUN opam repo add janestreet https://github.com/janestreet/opam-repository.git#7189f37af7eef83849b191d8f1e0e5d66ee78ce5
RUN opam update
RUN mv /usr/bin/gcc /usr/bin/gcc-real && \
    printf '#!/bin/bash\nexec /usr/bin/gcc-real -Wno-incompatible-pointer-types -Wno-int-conversion "${@/-Wno-everything/-w}"\n' > /usr/bin/gcc && \
    chmod +x /usr/bin/gcc
RUN opam install memtrace_viewer.v0.18~preview.130.83+317 -y --assume-depexts

EXPOSE 8080

ENTRYPOINT ["opam", "exec", "--", "memtrace-viewer"]
