resource "aws_route53_zone" "zone" {
  count         = var.create_dns_zone ? 1 : 0
  name          = var.domain_name
  comment       = var.domain_comment
  force_destroy = var.force_destroy
  tags          = var.tags
}

resource "aws_route53_record" "record" {
  count   = var.create_record ? 1 : 0
  zone_id = var.zone_id
  name    = var.record_name
  type    = var.record_type
  ttl     = var.record_ttl
  records = var.records
}

resource "aws_route53_record" "alias_record" {
  count    = var.create_alias_record ? 1 : 0
  name     = var.record_name
  type     = var.record_type
  ttl      = var.record_ttl
  zone_id                = var.zone_id

  alias {
    name                   = var.record_alias_name
    zone_id                = var.zone_id
    evaluate_target_health = var.alias_evaluate_target_health
  }
}
