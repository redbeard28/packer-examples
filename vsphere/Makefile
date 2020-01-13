#include digitalocean.env
#export $(shell sed 's/=.*//' digitalocean.env)

terraform-init:
	cd terraform && terraform init && cd -

terraform-plan:
	cd terraform && \
	terraform plan && \
	cd -

terraform-apply:
	cd terraform && \
	terraform apply && \
	cd -

debian911-packer-build:
	cd debian-911 && \
	time  packer build -var-file ../../variables.json debian-911-base.json && \
	cd -

debianbuster-packer-build:
	cd debian-buster && \
	time  packer build -var-file ../../variables.json debian-buster-base.json && \
	cd -

