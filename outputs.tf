output "zone_name" {
  value = var.create_dns_zone ? aws_route53_zone.zone[0].name : null
}

output "zone_arn" {
  value = var.create_dns_zone ? aws_route53_zone.zone[0].arn : null
}

output "zone_id" {
  value = var.create_dns_zone ? aws_route53_zone.zone[0].zone_id : null
}

output "record_name" {
  value = var.create_record ? aws_route53_record.record[0].name : null
}

output "record_fqdn" {
  value = var.create_record ? aws_route53_record.record[0].fqdn : null
}

output "alias_record_name" {
  value = var.create_alias_record ? aws_route53_record.alias_record[0].name : null
}

output "alias_record_fqdn" {
  value = var.create_alias_record ? aws_route53_record.alias_record[0].fqdn : null
}