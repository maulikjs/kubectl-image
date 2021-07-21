FROM registry.access.redhat.com/ubi8/ubi:latest

LABEL maintainer="Maulik Shah <maulik.shah1995@gmail.com>"

ENV KUBE_LATEST_VERSION="v1.21.1"

RUN yum -y install ca-certificates curl gzip jq procps tar wget

RUN export ARCH="$(uname -m)" && if [[ ${ARCH} == "x86_64" ]]; then export ARCH="amd64"; fi && curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBE_LATEST_VERSION}/bin/linux/${ARCH}/kubectl -o /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl 

WORKDIR /root
ENTRYPOINT ["kubectl"]
CMD ["help"]
