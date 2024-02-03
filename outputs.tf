output "zone_name" {
  value = var.create_dns_zone ? aws_route53_zone.zone[0].name : null
}

output "zone_arn" {
  value = var.create_dns_zone ? aws_route53_zone.zone[0].arn : null
}

output "zone_id" {
  value = var.create_dns_zone ? aws_route53_zone.zone[0].zone_id : null
}
