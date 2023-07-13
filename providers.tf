terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "4.10.0"
    }
  }
}

provider "cloudflare" {
  email = var.CF_EMAIL
  api_key = var.CF_API_KEY
}