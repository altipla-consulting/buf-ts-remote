
FROM node:14

LABEL "build.buf.plugins.runtime_library_versions.0.name"="@protobuf-ts/runtime-rpc"
LABEL "build.buf.plugins.runtime_library_versions.0.version"="v2.3.0"
LABEL "build.buf.plugins.runtime_library_versions.1.name"="@protobuf-ts/runtime"
LABEL "build.buf.plugins.runtime_library_versions.1.version"="v2.3.0"

RUN mkdir download && \
    cd download && \
    curl -Lq https://github.com/protocolbuffers/protobuf/releases/download/v3.19.4/protoc-3.19.4-linux-x86_64.zip -o protoc.zip && \
    unzip protoc.zip && \
    cp bin/protoc /usr/bin/protoc && \
    cd .. && \
    rm -r download

RUN mkdir /plugin
WORKDIR /plugin

COPY package.json .
COPY package-lock.json .
RUN npm ci

ENTRYPOINT ["npx", "protoc-gen-ts"]
