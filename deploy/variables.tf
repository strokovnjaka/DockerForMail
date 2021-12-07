variable "prefix" {
  default = "ucDailymail"
  description = "The prefix which should be used for all resources"
}

variable "location" {
  default = "West Europe"
  description = "The Azure Region in which all resources should be created."
}

variable "app_name" {
  default = "dailymail-app"
  description = "Application name"
}

variable "client_id" {}

variable "client_secret" {}