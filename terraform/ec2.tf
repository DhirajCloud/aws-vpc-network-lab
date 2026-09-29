resource "aws_instance" "public" {
  ami                         = "ami-0351a972f17e4d123"
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = [aws_security_group.public.id]
  associate_public_ip_address = true

  user_data = <<-EOF_USERDATA
    #!/bin/bash
    dnf update -y
    dnf install -y nginx
    systemctl enable nginx
    systemctl start nginx
    echo "AWS VPC Network Lab - Public EC2" > /usr/share/nginx/html/index.html
  EOF_USERDATA

  tags = {
    Name    = "${var.project_name}-public-ec2"
    Project = var.project_name
    Tier    = "Public"
  }
}
