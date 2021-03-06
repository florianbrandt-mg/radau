# Dockerfile used for development with livereload
FROM golang

ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH

RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && \
    chmod -R 777 "$GOPATH" && \
    go get github.com/tockins/realize

WORKDIR /go/src/github.com/factorycampus/radau
ENTRYPOINT ["./scripts/docker-entrypoint.sh"]
CMD ["realize", "start", "--no-config", "--legacy", "--run"]
