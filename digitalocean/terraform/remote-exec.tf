# Remote executing tasks
# First we push some files
resource "null_resource" "configure-debian-911" {
  connection {
      user = "root"
      host = "${digitalocean_droplet.staging.ipv4_address}"
      type = "ssh"
      private_key = "${file(var.pvt_key)}"
      timeout = "2m"
  }
  
  provisioner "file" {
    source = "../debian-911/debian-911.env"
    destination = "$HOME/"
  }

  # Executing make on remote debian server

  provisioner "remote-exec" {
    inline = [
      "${HOME}/packer-examples/digitalocean/debian-911/install-commons.sh  -a install-commons",
      "${HOME}/packer-examples/digitalocean/debian-911/install-commons.sh  -a install-ansible",
      "${HOME}/packer-examples/digitalocean/debian-911/install-commons.sh  -a lauch-playbook",
      "${HOME}/packer-examples/digitalocean/debian-911/install-commons.sh  -a remove-ansible"
    ]
  }

}