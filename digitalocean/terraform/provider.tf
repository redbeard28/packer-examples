provider "digitalocean" {
  token = "${var.digital_ocean_api_token}"
}

# Pre-declaration to use tfvars hiden (from github)
variable "digital_ocean_api_token" {}
variable "droplet_ssh_fingerprint" {}
variable "droplet_ssh_id" {}
variable "pvt_key" {}
variable "pub_key" {}

variable "droplet_name" {}

variable "droplet_image" {
  type = "map"
    default = {
        "debian_9" = "52644815"
        "debian_10" = "52648078"
    }
}

variable "droplet_size" {
   type = "map"
    default = {
        "small" = "s-1vcpu-1gb"
    }

}

variable "droplet_region" {
    type = "map"
    default = {
        "new_york_1" = "nyc1"
    }
}

