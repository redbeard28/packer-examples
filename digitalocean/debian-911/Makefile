include debian-911.env
export $(shell sed 's/=.*//' debian-911.env)

commons:
    git clone https://github.com/redbeard28/${REPO_NAME}.git && \
    chmod +x ${PATH_DEBIAN911_SCRIPTS}/*.sh
    chmod +x ${PATH_DEBIAN911_PLAYBOOK}/*.sh

install-ansible:
    cd ${PATH_DEBIAN911_SCRIPTS} && \
    ./ansible.sh

ansible-requirements:
    cd ${PATH_DEBIAN911_PLAYBOOK} && \
    ./install_requirements.sh

ansible-deploy-commons:
    cd ${PATH_DEBIAN911_PLAYBOOK} && \
    ansible-playbook --connection=local --inventory 127.0.0.1, deploy_commons.yml

remove-ansible:
    cd ${PATH_DEBIAN911_SCRIPTS} && \
    ./cleanup.sh