include digitalocean.env
export $(shell sed 's/=.*//' digitalocean.env)

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

packer-build:
	cd packer && \
	packer build template.json && \
	cd -

debian911-packer-build:
	cd debian-911 && \
	time  packer build debian-911-base.json && \
	cd -
