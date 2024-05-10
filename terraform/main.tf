module "sigstore" {
  // Change this to point to your local scaffolding checkout with // before terraform, e.g.
  // source = "/home/alice/sigstore/scaffolding//terraform/gcp/modules/sigstore"
  source = "git::https://github.com/sigstore/scaffolding.git//terraform/gcp/modules/sigstore?ref=517bf4ddec20d84956d404e94368b9af552988af"

  project_id               = var.project_id
  region                   = var.region
  bastion_zone             = var.zone
  cluster_name             = var.cluster_name
  mysql_instance_name      = var.cluster_name
  mysql_tier               = "db-n1-standard-4"
  ca_pool_name             = var.cluster_name
  github_repo              = ""
  tunnel_accessor_sa       = var.tunnel_accessor_sa
  gcs_logging_enabled      = false
  gcs_logging_bucket       = ""
  attestation_bucket       = format("%s-%s-attestations", var.project_id, var.cluster_name)
  tuf_bucket               = format("%s-%s-dev-tuf", var.project_id, var.cluster_name)
  tuf_preprod_bucket       = format("%s-%s-dev-tuf-preprod", var.project_id, var.cluster_name)
  tuf_service_account_name = "tuf-gha"
  tuf_bucket_member        = var.bucket_member
  redis_cluster_memory_size_gb = 20
  gke_cluster_security_group = ""
  gke_oauth_scopes = var.oauth_scopes
  oslogin = {
    enabled = true,
    enabled_with_2fa = false
  }
  timestamp = {
    enabled = false
  }
}

output "mysql_pass" {
    value = module.sigstore.mysql_pass
    sensitive = true
}
