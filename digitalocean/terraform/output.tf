output "public_ip" {
  value = "${digitalocean_droplet.staging.ipv4_address}"
  description = "The public IP address of the staging server"
}

output "private_ip" {
    value = "${digitalocean_droplet.staging.ipv4_address_private}"
}

output "hostname" {
    value = "${digitalocean_droplet.staging.name}"
}