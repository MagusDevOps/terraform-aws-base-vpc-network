resource "aws_egress_only_internet_gateway" "egress" {
  vpc_id = aws_vpc.network_hub_vpc.id

  tags = {
    Name = "${var.environment}-eigw"
  }
}