ARG IMAGE_NAME

FROM ${IMAGE_NAME}

ARG TARGETPLATFORM
ARG TARGETOS
ARG TARGETARCH
ARG TARGETVARIANT

ARG BUILDPLATFORM
ARG BUILDOS
ARG BUILDARCH
ARG BUILDVARIANT

ARG IMAGE_NAME

RUN echo "Image target platform details :: "
RUN echo "TARGETPLATFORM    : $TARGETPLATFORM"
RUN echo "TARGETOS          : $TARGETOS"
RUN echo "TARGETARCH        : $TARGETARCH"
RUN echo "TARGETVARIANT     : $TARGETVARIANT"

RUN echo "Image build platform details :: "
RUN echo "BUILDPLATFORM     : $BUILDPLATFORM"
RUN echo "BUILDOS           : $BUILDOS"
RUN echo "BUILDARCH         : $BUILDARCH"
RUN echo "BUILDVARIANT      : $BUILDVARIANT"

RUN echo "IMAGE_NAME        : $IMAGE_NAME"

WORKDIR /app

ADD . /app

RUN apt-get update -y && apt-get install time -y

ENTRYPOINT ["/app/benchmark.sh"]