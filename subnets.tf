resource "aws_subnet" "subnet-virginia" {
    provider = aws.region-virginia
    vpc_id = aws_vpc.vpc-virginia.id
    availability_zone = "us-east-1a"
    cidr_block = "10.0.1.0/24"
}

resource "aws_subnet" "subnet-central" {
    provider = aws.region-central
    vpc_id = aws_vpc.vpc-central.id
    availability_zone = "ca-central-1a"
    cidr_block = "10.1.1.0/24"
}

resource "aws_subnet" "subnet-frankfurt" {
    provider = aws.region-frankfurt
    vpc_id = aws_vpc.vpc-frankfurt.id
    availability_zone = "eu-central-1a"
    cidr_block = "10.2.1.0/24"
}