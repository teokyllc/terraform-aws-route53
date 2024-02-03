variable "create_dns_zone" {
  type        = bool
  description = "If enabled created a R53 DNS zone."
  default     = false
}

variable "domain_name" {
  type        = string
  description = "This is the name of the hosted zone."
  default     = null
}

variable "domain_comment" {
  type        = string
  description = "A comment for the hosted zone."
  default     = "Managed by Terraform"
}

variable "force_destroy" {
  type        = bool
  description = "Whether to destroy all records (possibly managed outside of Terraform) in the zone when destroying the zone."
  default     = false
}

variable "tags" {
  type        = map
  description = "A map of tags."
  default     = null
}

variable "zone_id" {
  type        = string
  description = "The Route 53 zone id to add records to."
  default     = false
}

variable "records" {
  default = null
}

variable "alias_records" {
  default = null
}

variable "vpc_id" {
  type        = string
  description = "The VPC id if domain in internal only."
  default     = null
}

variable "enable_private_dns" {
  type        = bool
  description = "If true the DNS zone is internal only."
  default     = null
}
