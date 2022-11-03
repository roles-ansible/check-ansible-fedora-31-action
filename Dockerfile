# hadolint ignore=DL3007
FROM fedora:31

LABEL "maintainer"="L3D <l3d@c3woc.de>"
LABEL "repository"="https://github.com/roles-ansible/check-ansible-fedora-31-action.git"
LABEL "homepage"="https://github.com/roles-ansible/check-ansible-fedora-31-action"

LABEL "com.github.actions.name"="check-ansible-fedora-31"
LABEL "com.github.actions.description"="Check ansible role or playbook with CentOS 31"
LABEL "com.github.actions.icon"="aperture"
LABEL "com.github.actions.color"="green"

# hadolint ignore=DL3008,DL3013,DL3041
RUN dnf update --assumeyes && dnf install --assumeyes \
    python3 \
    python3-pip \
    git \
    gcc \
    python-setuptools \
    libffi \
      && dnf clean all \
      && pip3 install --no-cache-dir ansible \
      && ansible --version

COPY ansible-docker.sh /ansible-docker.sh
ENTRYPOINT ["/ansible-docker.sh"]
