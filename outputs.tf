output "access_application" {
  value = "https://${cloudflare_record.bastion.hostname}"
}

output "server_command" {
  value = "cloudflared tunnel run --token ${nonsensitive(cloudflare_tunnel.bastion.tunnel_token)}"
}

output "client_command" {
  value = "cloudflared access tcp --hostname ${cloudflare_record.bastion.hostname} --destination 10.0.0.2:8080 localhost:3000"
}