resource "aws_ram_resource_share" "share_group" {
  count                     = var.ram_enabled && var.transit_gateway_enabled ? 1 : 0
  name                      = "${var.environment}-transit-gateway"
  allow_external_principals = false

  tags = {
    environment = var.environment
  }
}

resource "aws_ram_resource_association" "transit_gateway_ram_share" {
  count              = var.ram_enabled && var.transit_gateway_enabled ? 1 : 0
  resource_arn       = aws_ec2_transit_gateway.transit_gateway[0].arn
  resource_share_arn = aws_ram_resource_share.share_group[0].arn
}

resource "aws_ram_principal_association" "transit_gateway_ram_principle_association" {
  count              = var.ram_enabled && var.transit_gateway_enabled ? 1 : 0
  principal          = var.ram_principle_id
  resource_share_arn = aws_ram_resource_share.share_group[0].arn
}