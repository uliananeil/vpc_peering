resource "aws_instance" "nginx-virginia" {
    provider = aws.region-virginia
  ami                    = "ami-0b5eea76982371e91"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.subnet-virginia.id
  vpc_security_group_ids = [aws_security_group.sg-virginia.id]

  associate_public_ip_address = true

  #userdata
  user_data = <<EOF
#!/bin/bash
sudo yum update
sudo amazon-linux-extras enable epel
sudo yum install -y epel-release
sudo yum install -y nginx
sudo systemctl enable nginx
sudo systemctl start nginx
EOF

}

resource "aws_instance" "nginx-central" {
    provider = aws.region-central
  ami                    = "ami-06c3426233c180fef"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.subnet-central.id
  vpc_security_group_ids = [aws_security_group.sg-central.id]

  associate_public_ip_address = true

  #userdata
  user_data = <<EOF
#!/bin/bash
sudo yum update
sudo amazon-linux-extras enable epel
sudo yum install -y epel-release
sudo yum install -y nginx
sudo systemctl enable nginx
sudo systemctl start nginx
EOF

}

resource "aws_instance" "nginx-frankfurt" {
    provider = aws.region-frankfurt
  ami                    = "ami-0a261c0e5f51090b1"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.subnet-frankfurt.id
  vpc_security_group_ids = [aws_security_group.sg-frankfurt.id]

  associate_public_ip_address = true

  #userdata
  user_data = <<EOF
#!/bin/bash
sudo yum update
sudo amazon-linux-extras enable epel
sudo yum install -y epel-release
sudo yum install -y nginx
sudo systemctl enable nginx
sudo systemctl start nginx
EOF

}