variable "ubuntu_image" {
  description = "Версия Убунты"
  type = string
  default = "ubuntu-22-10-x64"
}
variable "region" {
  description = "Регион Сингапур"
  type = string
  default = "SGP1"
}
variable "size" {
  description = "Параметры дроплета"
  type = string
  default = "s-2vcpu-2gb"
}