FROM ocaml/opam:ubuntu-24.04-ocaml-5.2

RUN sudo apt-get update && sudo apt-get install -y libgmp-dev pkg-config libffi-dev libssl-dev zlib1g-dev && sudo rm -rf /var/lib/apt/lists/*

RUN opam repo add janestreet https://github.com/janestreet/opam-repository.git#7189f37af7eef83849b191d8f1e0e5d66ee78ce5
RUN opam update
RUN opam install memtrace_viewer.v0.18~preview.130.83+317 -y

EXPOSE 8080

ENTRYPOINT ["opam", "exec", "--", "memtrace-viewer"]
