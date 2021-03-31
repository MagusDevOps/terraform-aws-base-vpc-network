resource "aws_ec2_transit_gateway" "transit_gateway" {
  count                           = var.transit_gateway_enabled ? 1 : 0
  description                     = "${var.environment}-transit-gateway"
  default_route_table_association = "disable"
  default_route_table_propagation = "disable"
  auto_accept_shared_attachments  = "enable"

  tags = {
    environment = var.environment
  }
}

output "transit_gateway_id" {
  value = var.transit_gateway_enabled ? aws_ec2_transit_gateway.transit_gateway[0].id : var.transit_gateway_id
}

output "transit_gateway_arn" {
  value = var.transit_gateway_enabled ? aws_ec2_transit_gateway.transit_gateway[0].arn : ""
}