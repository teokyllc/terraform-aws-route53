# terraform-aws-route53
This is a Terraform module that creates a Route 53 DNS zone.<br>
[AWS Route 53](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/Welcome.html)<br>
[Terraform AWS Route 53 Hosted Zone](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_zone)<br>
[Terraform AWS Route 53 Record](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record)<br>


## Using specific versions of this module
You can use versioned release tags to ensure that your project using this module does not break when this module is updated in the future.<br>

<b>Repo latest commit</b><br>
```
module "r53" {
  source = "github.com/teokyllc/terraform-aws-route53"
  ...
```
<br>

<b>Tagged release</b><br>

```
module "r53" {
  source = "github.com/teokyllc/terraform-aws-route53?ref=1.0.0"
  ...
```
<br>

## Examples of using this module
This is an example of using this module to create a DNS zone with records.<br>

```
module "r53" {
  source = "github.com/teokyllc/terraform-aws-route53?ref=1.0.0"
  tags_platform                  = "mrionline"
  tags_platform_region           = "global"
  tags_layer                     = "dns"
  tags_environment               = "test"
  openedx_domain_create_dns_zone = true
  openedx_domain_domain_name     = "testapp.mrionline.com"
  openedx_domain_force_destroy   = false

  create_records = true
  records = {
    mail  = {
      name    = "mail"
      type    = "A"
      ttl     = 300
      records = ["1.2.3.4"]
    }
  }

  create_alias_records = false
  alias_records = {
    root = {
      name                         = ""
      type                         = "A"
      ttl                          = 300
      alias_dns_name               = aws_elb.main.dns_name
      alias_zone_id                = aws_elb.main.zone_id
      alias_evaluate_target_health = true
    }
    www = {
      name                         = "www"
      type                         = "A"
      ttl                          = 300
      alias_dns_name               = aws_elb.main.dns_name
      alias_zone_id                = aws_elb.main.zone_id
      alias_evaluate_target_health = true
    }
  }
}
```

<br><br>
Module can be tested locally:<br>
```
git clone https://github.com/teokyllc/terraform-aws-route53.git
cd terraform-aws-route53

cat <<EOF > <MODULE_NAME>.auto.tfvars
is_db_instance                  = true
allocated_storage               = 20
max_allocated_storage           = 100
rds_instace_name                = "test"
db_name                         = "test"
engine                          = "mysql"
engine_version                  = "5.7"
instance_class                  = "db.t3.micro"
publicly_accessible             = false
apply_immediately               = false
skip_final_snapshot             = true
allow_major_version_upgrade     = false
deletion_protection             = false
backup_retention_period         = 7
availability_zone               = "a"
backup_window                   = "00:00-02:00"
maintenance_window              = "Sun:02:00-Sun:05:00"
kms_key_id                      = null
character_set_name              = null
multi_az                        = false
rds_subnet_tier                 = "data"
security_group_ids              = ["sg-0c40e0d2faba017ca"]
snapshot_identifier             = null
storage_type                    = "gp2"
iops                            = null
storage_encrypted               = false
vpc_id                          = "vpc-0eeca0e683a8b1ca5"
enabled_cloudwatch_logs_exports = ["audit", "error", "general", "slowquery"]
parameters = [ 
  {
  name = "character_set_connection"
  value = "utf8"
  },
  {
  name = "character_set_server"
  value = "utf8"
  }
]
tags = {
    tag = "value"
}
EOF

terraform init
terraform apply
```