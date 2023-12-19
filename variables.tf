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

variable "create_record" {
  type        = bool
  description = "Creates a DNS record."
  default     = false
}

variable "create_alias_record" {
  type        = bool
  description = "Creates a DNS alias record."
  default     = false
}

variable "zone_id" {
  type        = string
  description = "The Route 53 zone id to add records to."
  default     = false
}

variable "record_name" {
  type        = string
  description = "DNS record name."
  default     = null
}

variable "record_type" {
  type        = string
  description = "DNS record type."
  default     = null
}

variable "record_ttl" {
  type        = string
  description = "DNS record time to live."
  default     = null
}

variable "records" {
  type        = list(any)
  description = "A list of DNS records."
  default     = null
}

variable "alias_evaluate_target_health" {
  type        = bool
  description = "Evaluates the health of the alias target."
  default     = null
}

variable "record_alias_name" {
  type        = string
  description = "DNS record name."
  default     = null
}
