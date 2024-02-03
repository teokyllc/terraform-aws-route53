resource "aws_route53_zone" "zone" {
  count         = var.create_dns_zone ? 1 : 0
  name          = var.domain_name
  comment       = var.domain_comment
  force_destroy = var.force_destroy
  tags          = var.tags

  dynamic "vpc" {
    for_each = var.enable_private_dns ? [1] : []
    content {
      vpc_id = var.vpc_id
    }
  }
}

resource "aws_route53_record" "records" {
  for_each = var.records
  zone_id  = var.zone_id
  name     = each.value["name"]
  type     = each.value["type"]
  ttl      = each.value["ttl"]
  records  = each.value["records"]
}

resource "aws_route53_record" "alias_records" {
  for_each = var.alias_records
  name     = each.value["name"]
  type     = each.value["type"]
  ttl      = each.value["ttl"]
  zone_id  = var.zone_id

  alias {
    name                   = each.value["alias_name"]
    zone_id                = each.value["alias_zone_id"]
    evaluate_target_health = each.value["alias_evaluate_target_health"]
  }
}
