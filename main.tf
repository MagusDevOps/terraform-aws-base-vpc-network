/**
 * # Base VPC Network
 * provides a solid base for most application to get started on it provides the ability to:
 * * Create the VPC
 * * Create 3 standard route tables (public, private, no-internet)
 * * creates and adds an internet gateway to the public route table
 * * has the ability to create a nat gateway and attache it to the private route table
 * * has the ability to create a transit gateway
 * * has the ability to attach the vpc to the transit gateway
 * * has the ability to share the transit gateway with your organization
 *
 */

variable "aws_vpc_cidr" {
  type        = string
  description = "cidr for the vpc that is to be created to us"
}

variable "environment" {
  type        = string
  description = "used to tag resources with an environment tag"
}

variable "aws_cidr_map" {
  type = object({
    transit_gateway = string
  })
  default     = {}
  description = "required if transit_gateway_enabled is set to tru"
}

variable "zones" {
  type = object({
    zone = object({
      name = string
      id   = string
    })
  })
  description = "is from output of x-account-az-mapping module"
}
variable "zone_priority" {
  type        = list(string)
  description = "used to prioritize high availability resource creation following the zone creation order defined"
}

variable "nat_gateway_enabled" {
  type        = bool
  default     = false
  description = "flag to enable the creation of a nat gateway"
}
variable "nat_gateway_count" {
  type        = number
  default     = 1
  description = "allows for the creation of multiple nat gateways for HA private egress"
}

variable "ram_principle_id" {
  type        = string
  default     = ""
  description = "the resources access management principle id with which to share the transit gateway if transit gateway and ram are enabled"
}

variable "ram_enabled" {
  type        = bool
  default     = false
  description = "allows the sharing of the transit gateway with organization accounts"
}

variable "transit_gateway_enabled" {
  type        = bool
  default     = false
  description = "flag to enable the creation of a transit gateway"
}

variable "transit_gateway_attachment_enabled" {
  type        = bool
  default     = false
  description = "flag to enable the attachment of the vpc created in the module"
}

variable "transit_gateway_id" {
  type        = string
  default     = ""
  description = "the transit gateway id to be used to attach the vpc to if attachment enabled and transit gateway created through a different instance or process"
}

variable "transit_gateway_subnet_count" {
  type        = number
  default     = 1
  description = "the number of subnets to create with the transit gateway, effects HA ability"
}

locals {
  zones_keys           = keys(var.zones)
  zones_keys_index_map = { for zone_key in local.zones_keys : zone_key => index(local.zones_keys, zone_key) }
}