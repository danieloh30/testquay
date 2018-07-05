FROM ubuntu
ENV FIRST first
ENV SECOND second
ARG somearg=foo
RUN apt-get update
RUN apt-get install -y git
ADD . .
RUN echo foo126 > bar

FROM alpine:latest
COPY --from=0 bar baz
LABEL foo=bar
LABEL this.is.cool="{\"some\":\"json\"}"
RUN cat baz
