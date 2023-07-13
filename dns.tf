data "cloudflare_zone" "tunnel" {
  account_id = var.CF_ACCOUNT_TAG
  zone_id = var.CF_ZONE_ID
}

resource "cloudflare_record" "bastion" {
  zone_id = data.cloudflare_zone.tunnel.id
  name    = var.ENVIRONMENT_NAME
  value   = "${cloudflare_tunnel.bastion.id}.cfargotunnel.com"
  type    = "CNAME"
  proxied = true
}