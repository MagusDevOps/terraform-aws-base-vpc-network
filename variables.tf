variable "aws_vpc_cidr" {}
variable "environment" {}

variable "aws_cidr_map" { type = map }

variable "zones" { type = map }
variable "zone_priority" { type = list }

variable "nat_gateway_enabled" {default = false}
variable "nat_gateway_count" { default = 1 }

locals {
  zones_keys = keys(var.zones)
  zones_keys_index_map = { for zone_key in local.zones_keys: zone_key => index(local.zones_keys, zone_key)}
}