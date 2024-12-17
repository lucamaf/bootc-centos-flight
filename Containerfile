FROM quay.io/centos-bootc/centos-bootc:stream9

RUN dnf -y copr enable @redhat-et/flightctl-dev centos-stream-9-x86_64 && \
    dnf -y install flightctl-agent; \
    dnf -y clean all; \
    systemctl enable flightctl-agent.service

# Optional: to enable podman-compose application support uncomment below”
RUN dnf -y install epel-release epel-next-release && \
    dnf -y install podman-compose && \
    systemctl enable podman.service

ADD config.yaml /etc/flightctl/config.yaml
