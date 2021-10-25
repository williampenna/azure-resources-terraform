variable "PROJECT" {}
variable "ENVIRONMENT" {}
variable "LOCATION" {}

# SECRETS, PLEASE PROVIDE THESE VALUES IN A TFVARS FILE
variable "SUBSCRIPTION_NAME" {
  default = "Microsoft Azure Sponsorship"
}

variable "SUBSCRIPTION_ID" {
  default = "95796d64-cbc7-4d06-ac39-e217b1fa0cdc"
}

variable "TENANT_ID" {
  default = "41b6ad65-0042-4be8-bb5c-e2bc91d1c935"
}
