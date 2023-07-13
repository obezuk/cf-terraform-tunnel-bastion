# Terraform - Cloudflare Access / Tunnel Bastion

This repository deploys cloudflared as a bastion server. See https://blog.cloudflare.com/protecting-remote-desktops-at-scale-with-cloudflare-access/ for more information.

# Usage

- `cp terraform.tfvars.example terraform.tfvars`
- Configure terraform.tfvars with your API token / Cloudflare Account / Zone identifiers
- `terraform init`
- `terraform apply`

## Run cloudflared on server as a Bastion host

- `cloudflared tunnel run --token [SECRET]` (see Terraform output)

## Connect local machine to remote service

- `cloudflared access [tcp|rdp|ssh] --hostname [ACCESS_HOSTNAME] --destination [REMOTEHOST]:[REMOTEPORT] localhost:[LOCAL_PORT]` (see Terraform output)