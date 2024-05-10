variable "project_id" {
  type = string
  validation {
    condition     = length(var.project_id) > 0
    error_message = "Must specify project_id variable."
  }
}

variable "region" {
  description = "The region in which to create the VPC network"
  type        = string
  default     = "us-west1"
}

variable "zone" {
  description = "The zone to run the bastion in"
  type        = string
  default     = "us-west1-c"
}

variable "cluster_name" {
  description = "The name to give the new Kubernetes cluster"
  type        = string
  default     = "sigstoredev"
}

variable "tunnel_accessor_sa" {
  type        = string
  description = "Email of group to give access to the tunnel to"
}

variable "bucket_member" {
  type        = string
  description = "User, group, or service account with access to the TUF bucket. Use 'allUsers' for general access, or e.g. group:mygroup@myorg.com for granular access"
  default     = "allUsers"
}

variable "oauth_scopes" {
  type = list(string)
  description = "OAuth access scopes for GKE nodes. See https://cloud.google.com/kubernetes-engine/docs/how-to/access-scopes."
  default = [
    "https://www.googleapis.com/auth/cloud-platform",
    "https://www.googleapis.com/auth/userinfo.email"
  ]
}
