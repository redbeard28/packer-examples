include digitalocean.env
export $(shell sed 's/=.*//' digitalocean.env)

terraform-destroy:
	cd terraform && \
	terraform destroy && \
	cd -

terraform-validate:
	cd terraform && \
	terraform validate && \
	cd -

terraform-init:
	cd terraform && terraform init -input=false && cd -

terraform-plan:
	cd terraform && \
	terraform plan -out=tfplan -input=false && \
	cd -

terraform-apply:
	cd terraform && \
	terraform apply -auto-approve -input=false tfplan && \
	cd -

terraform-deploy:
	cd terraform && \
	terraform validate && \
	terraform init -input=false && \
	terraform plan -out=tfplan -input=false && \
	terraform apply -auto-approve -input=false tfplan && \
	cd -

################ PACKER BUILDER ################

packer-build:
	cd packer && \
	packer build template.json && \
	cd -

debian911-packer-build:
	cd debian-911 && \
	time  packer build debian-911-base.json && \
	cd -