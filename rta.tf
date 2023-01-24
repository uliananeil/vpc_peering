resource "aws_main_route_table_association" "rta-virginia" {
  provider = aws.region-virginia
  vpc_id = aws_vpc.vpc-virginia.id
  route_table_id = aws_route_table.rt-virginia.id
}

resource "aws_main_route_table_association" "rta-central" {
  provider = aws.region-central
  vpc_id = aws_vpc.vpc-central.id
  route_table_id = aws_route_table.rt-central.id
}

resource "aws_main_route_table_association" "rta-frankfurt" {
  provider = aws.region-frankfurt
  vpc_id = aws_vpc.vpc-frankfurt.id
  route_table_id = aws_route_table.rt-frankfurt.id
}