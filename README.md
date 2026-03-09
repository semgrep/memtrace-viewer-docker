# memtrace-viewer, in a Docker container

It's annoying to run the latest version of memtrace-viewer since it requires setting up another opam switch with Jane Street's custom Opam repo. This repo has a little Dockerfile that lets you run it more easily.

To use it on a given trace `/path/to/mytrace.ctf`, run
```bash
docker run --rm -p 8080:8080 -v /path/to/mytrace.ctf:/data/trace.ctf ghcr.io/semgrep/memtrace-viewer-docker:latest /data/trace.ctf
```
