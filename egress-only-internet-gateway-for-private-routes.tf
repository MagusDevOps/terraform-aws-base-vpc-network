resource "aws_egress_only_internet_gateway" "egress" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.environment}-eigw"
  }
}