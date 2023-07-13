variable "CF_EMAIL" {
  type     = string
}

variable "CF_API_KEY" {
  type     = string
}

variable "ENVIRONMENT_NAME" {
  type     = string
  default = "cf-tunnel-bastion"
}

variable "CF_ACCOUNT_TAG" {
  type     = string
}

variable "CF_ZONE_ID" {
  type     = string
}