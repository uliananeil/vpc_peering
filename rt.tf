# Route table to region-virginia
resource "aws_route_table" "rt-virginia" {
  provider = aws.region-virginia
  vpc_id = aws_vpc.vpc-virginia.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-virginia.id
  }
  route {
    cidr_block = "10.1.1.0/24"
    vpc_peering_connection_id = aws_vpc_peering_connection.virginia-central.id
  }
  route {
    cidr_block = "10.2.1.0/24"
    vpc_peering_connection_id = aws_vpc_peering_connection.frankfurt-virginia.id
  }
  lifecycle {
    ignore_changes = all
  }
  tags = {
    Name = "Virginia-Region-RT"
  }
}

# Route table to region-central
resource "aws_route_table" "rt-central" {
  provider = aws.region-central
  vpc_id = aws_vpc.vpc-central.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-central.id
  }
  route {
    cidr_block = "10.0.1.0/24"
    vpc_peering_connection_id = aws_vpc_peering_connection.virginia-central.id
  }
  route {
    cidr_block = "10.2.1.0/24"
    vpc_peering_connection_id = aws_vpc_peering_connection.central-frankfurt.id
  }
  lifecycle {
    ignore_changes = all
  }
  tags = {
    Name = "Central-Region-RT"
  }
}

# Route table to region-vfrankfurt
resource "aws_route_table" "rt-frankfurt" {
  provider = aws.region-frankfurt
  vpc_id = aws_vpc.vpc-frankfurt.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-frankfurt.id
  }
  route {
    cidr_block = "10.0.1.0/24"
    vpc_peering_connection_id = aws_vpc_peering_connection.frankfurt-virginia.id
  }
  route {
    cidr_block = "10.1.1.0/24"
    vpc_peering_connection_id = aws_vpc_peering_connection.central-frankfurt.id
  }
  lifecycle {
    ignore_changes = all
  }
  tags = {
    Name = "Frankfurt-Region-RT"
  }
}
