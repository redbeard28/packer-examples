/*resource "digitalocean_ssh_key" "default" {
  name       = "DigitalOcean_Terraform"
  public_key = "${var.pub_key}"
  fingerprint = "${var.droplet_ssh_fingerprint}"
}*/
/*
Pub_key1 => Mac
Pub_Key2 => Admin_Server
*/

resource "digitalocean_droplet" "staging" {
  //hostname = "staging"
  image = "${var.droplet_image["debian_9"]}"
  name = "${var.droplet_name}"
  region = "${var.droplet_region["new_york_1"]}"
  size =  "${var.droplet_size["small"]}"
  private_networking = true
  #ssh_keys = ["${digitalocean_ssh_key.default.fingerprint}"]
  ssh_keys = ["${var.droplet_ssh_fingerprint.pub_key1}","${var.droplet_ssh_fingerprint.pub_key2}"]

  connection {
      user = "root"
      host = "${digitalocean_droplet.staging.ipv4_address}"
      type = "ssh"
      private_key = "${file(var.pvt_key)}"
      timeout = "2m"
  }

}

