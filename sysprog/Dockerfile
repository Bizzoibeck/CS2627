# Linux-x86-64-Umgebung für die SysProg-Übungen (NASM, C, gdb).
#
# Bauen (einmalig, aus dem Ordner sysprog/):
#   docker build --platform linux/amd64 -t sysprog .
#
# Terminal starten (aus dem Ordner sysprog/, mountet sysprog/ nach /work):
#   docker run --rm -it --platform linux/amd64 -v "$PWD":/work -w /work sysprog

FROM ubuntu:24.04

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        nasm gcc clang libc6-dev make gdb valgrind binutils \
    && rm -rf /var/lib/apt/lists/*

CMD ["bash"]
