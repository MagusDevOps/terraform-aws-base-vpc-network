resource "aws_ec2_transit_gateway_vpc_attachment" "vpc_attachment" {
  count = var.transit_gateway_attachment_enabled ? 1 : 0
  subnet_ids         = slice([for subnet in aws_subnet.transit_gateway_subnets: subnet.id ], 0, var.transit_gateway_subnet_count)
  transit_gateway_id = var.transit_gateway_enabled ? aws_ec2_transit_gateway.transit_gateway[0].id : var.transit_gateway_id
  transit_gateway_default_route_table_association = false
  transit_gateway_default_route_table_propagation = false
  vpc_id             = aws_vpc.vpc.id
}

output "transit_gateway_vpc_attachment_id" {
  value = var.transit_gateway_attachment_enabled ? aws_ec2_transit_gateway_vpc_attachment.vpc_attachment[0].id : ""
}