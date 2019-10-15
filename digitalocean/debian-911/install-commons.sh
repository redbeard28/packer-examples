#!/bin/bash -eux
job_name=`basename "$0"`
source ${HOME}/debian-911.env


usage() {
  echo "
    $job_name -a install-commons
    $job_name -a install-ansible
    $job_name -a lauch-playbook
    $job_name -a remove-ansible
  "


}

while getopts "a:h" OPTION; do
    case "${OPTION}" in
        a)
            ACTION=${OPTARG}
            ;;
        h)
            usage
            ;;
        *)
            usage
            exit 1
            ;;
    esac
done

install-commons() {
  apt-get update
  apt-get -y upgrade
  apt-get -y install git
  git clone https://github.com/redbeard28/${REPO_NAME}.git && \
  chmod +x ${PATH_DEBIAN911_SCRIPTS}/*.sh
  chmod +x ${PATH_DEBIAN911_PLAYBOOK}/*.sh
}

install-ansible() {
    cd ${PATH_DEBIAN911_SCRIPTS} && \
    ./ansible.sh
}

ansible-requirements() {
    cd ${PATH_DEBIAN911_PLAYBOOK} && \
    ./install_requirements.sh
}

ansible-deploy-commons() {
    ansible-requirements
    cd ${PATH_DEBIAN911_PLAYBOOK} && \
    ansible-playbook --connection=local --inventory 127.0.0.1, deploy_commons.yml
}

remove-ansible() {
    cd ${PATH_DEBIAN911_SCRIPTS} && \
    ./cleanup.sh
}

case "${ACTION}" in
    install-commons)
        install-commons
        ;;
    install-ansible)
        install-ansible
        ;;
    lauch-playbook)
        lauch-playbook
        ;;
    remove-ansible)
        remove-ansible
        ;;
    *)
        usage
        exit 1
        ;;
esac

