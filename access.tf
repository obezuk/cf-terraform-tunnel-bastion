resource "cloudflare_access_application" "bastion" {
  zone_id                   = var.CF_ZONE_ID
  name                      = var.ENVIRONMENT_NAME
  domain                    = cloudflare_record.bastion.hostname
  type                      = "self_hosted"
  session_duration          = "24h"
  auto_redirect_to_identity = false
}

resource "cloudflare_access_policy" "bastion" {
  application_id = cloudflare_access_application.bastion.id
  zone_id        = var.CF_ZONE_ID
  name           = "Allow Root User"
  precedence     = "1"
  decision       = "allow"

  include {
    email = [var.CF_EMAIL]
  }

}