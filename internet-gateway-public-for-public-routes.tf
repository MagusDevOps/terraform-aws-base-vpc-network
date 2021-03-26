resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.network_hub_vpc.id

  tags = {
    Name = "${var.environment}-igw"
  }
}