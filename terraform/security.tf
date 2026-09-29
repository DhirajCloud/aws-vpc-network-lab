data "http" "my_public_ip" {
  url = "https://checkip.amazonaws.com/"
}

resource "aws_security_group" "public" {
  name        = "${var.project_name}-public-sg"
  description = "Security group for the public EC2 instance"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "SSH from administrator IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${chomp(data.http.my_public_ip.response_body)}/32"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "${var.project_name}-public-sg"
    Project = var.project_name
  }
}
