resource "aws_security_group" "sg-virginia" {
  provider = aws.region-virginia
  name = "virginia-sg"
  description = "Allow 80"
  vpc_id = aws_vpc.vpc-virginia.id

  ingress {
    description = "Allow 80 from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "allow traffic from central and virginia"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [aws_vpc.vpc-central.cidr_block, aws_vpc.vpc-frankfurt.cidr_block]
  }
  ingress {
    description = "Allow 22 from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "sg-central" {
  provider = aws.region-central
  name = "central-sg"
  description = "Allow trafic"
  vpc_id = aws_vpc.vpc-central.id

  ingress {
    description = "Allow 80 from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "allow traffic from central and virginia"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [aws_vpc.vpc-virginia.cidr_block, aws_vpc.vpc-frankfurt.cidr_block]
  }
  ingress {
    description = "Allow 22 from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "sg-frankfurt" {
  provider = aws.region-frankfurt
  name = "frankfurt-sg"
  description = "Allow trafic"
  vpc_id = aws_vpc.vpc-frankfurt.id

  ingress {
    description = "Allow 80 from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "allow traffic from central and virginia"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [aws_vpc.vpc-central.cidr_block, aws_vpc.vpc-virginia.cidr_block]
  }
  ingress {
    description = "Allow 22 from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}