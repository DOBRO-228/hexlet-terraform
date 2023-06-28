// main.tf - имя файла выбрано произвольно, важно только расширение
terraform {
  required_providers {
    // Здесь указываются все провайдеры, которые будут использоваться
    digitalocean = {
      source = "digitalocean/digitalocean"
      // Версия может обновиться
      version = "~> 2.0"
    }
  }
}

// Terraform должен знать ключ, для выполнения команд по API

// Определение переменной, которую нужно будет задать
variable "do_token" {}

// Установка значения переменной
provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_droplet" "terraform_web1" {
  image  = "ubuntu-22-10-x64"

  name   = "web1"
  region = "SGP1"
  size   = "s-1vcpu-1gb"
}

# resource "digitalocean_droplet" "terraform_web2" {
#   image  = "ubuntu-22-10-x64"
#   name   = "terraform-web-2"
#   region = "SGP1"
#   size   = "s-1vcpu-1gb"
# }
