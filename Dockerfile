FROM fedora:31

LABEL "maintainer"="L3D <l3d@c3woc.de>"
LABEL "repository"="https://github.com/roles-ansible/check-ansible-fedora-31-action.git"
LABEL "homepage"="https://github.com/roles-ansible/check-ansible-fedora-31-action"

LABEL "com.github.actions.name"="check-ansible-fedora-31"
LABEL "com.github.actions.description"="Check ansible role or playbook with CentOS 31"
LABEL "com.github.actions.icon"="aperture"
LABEL "com.github.actions.color"="green"

RUN dnf update --assumeyes && dnf install --assumeyes \
    python3 \
    python3-pip \
    git

RUN pip3 install setuptools && pip3 install ansible

RUN ansible --version

ADD ansible-docker.sh /ansible-docker.sh
ENTRYPOINT ["/ansible-docker.sh"]
