resource "random_id" "tunnel_secret" {
    byte_length = 32
    keepers = {
        tunnel_name = var.ENVIRONMENT_NAME
        salt = "init"
    }
}

resource "cloudflare_tunnel" "bastion" {
    account_id = var.CF_ACCOUNT_TAG
    name       = var.ENVIRONMENT_NAME
    secret     = random_id.tunnel_secret.b64_std
    config_src = "cloudflare"
}

resource "cloudflare_tunnel_config" "bastion" {
  account_id = var.CF_ACCOUNT_TAG
  tunnel_id  = cloudflare_tunnel.bastion.id

  config {

    warp_routing {
      enabled = false
    }

    ingress_rule {
      hostname = cloudflare_record.bastion.hostname
      service = "bastion"
    }

    ingress_rule {
      service = "http_status:404"
    }
  }
}