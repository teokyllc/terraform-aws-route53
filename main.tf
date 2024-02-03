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
