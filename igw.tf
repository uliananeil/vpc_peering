resource "aws_internet_gateway" "igw-virginia" {
  provider = aws.region-virginia
  vpc_id = aws_vpc.vpc-virginia.id
}

resource "aws_internet_gateway" "igw-central" {
  provider = aws.region-central
  vpc_id = aws_vpc.vpc-central.id
}

resource "aws_internet_gateway" "igw-frankfurt" {
  provider = aws.region-frankfurt
  vpc_id = aws_vpc.vpc-frankfurt.id
}