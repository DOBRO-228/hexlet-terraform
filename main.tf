// main.tf - имя файла выбрано произвольно, важно только расширение
terraform {
  required_providers {
    // Здесь указываются все провайдеры, которые будут использоваться
    digitalocean = {
      source = "digitalocean/digitalocean"
      // Версия может обновиться
      version = "~> 2.0"
    }
    datadog = {
      source = "DataDog/datadog"
      version = "3.26.0"
    }
  }
}

variable "do_token" {}
provider "digitalocean" {
  token = var.do_token
}


variable "datadog_token" {}
provider "datadog" {
  api_key = var.datadog_token
}

resource "digitalocean_droplet" "terraform_web1" {
  image  = var.ubuntu_image
  name   = "web1"
  region = var.region
  size   = var.size
  monitoring = true
}

resource "digitalocean_droplet" "terraform_web2" {
  image  = var.ubuntu_image
  name   = "web2"
  region = var.region
  size   = var.size
  monitoring = true
}

resource "digitalocean_droplet" "terraform_web3" {
  image  = var.ubuntu_image
  name   = "web3"
  region = var.region
  size   = var.size
  monitoring = true
}

resource "digitalocean_loadbalancer" "terraform_loadbalancer" {
  name   = "loadbalancer-2"
  region = "sgp1"

  forwarding_rule {
    entry_port     = 80
    entry_protocol = "http"

    target_port     = 80
    target_protocol = "http"
  }

  healthcheck {
    port     = 22
    protocol = "tcp"
  }

  droplet_ids = [
    digitalocean_droplet.terraform_web1.id,
    digitalocean_droplet.terraform_web2.id,
    digitalocean_droplet.terraform_web3.id,
  ]
}