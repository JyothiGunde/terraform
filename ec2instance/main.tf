resource "aws_instance" "web" {
  ami = var.os
  instance_type = var.size
  security_groups = [ aws_security_group.TF_SG.name ]
  key_name = "jyoti"
  user_data = file("script.sh")
  count = 1
  tags = {
    
    Name = "instance ${count.index}"
  }

  depends_on = [ aws_security_group.TF_SG ]
}

resource "aws_security_group" "TF_SG" {
  name        = "SG from TG"
  description = "SG from TG"
  vpc_id      = "vpc-02a5b47afd3487bae"

  ingress {
    description = "Allow SSH from your IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Replace with your IP
  }

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "TF_SG"
  }
}

# resource "tls_private_key" "rsa" {
#   algorithm = "RSA"
#   rsa_bits  = 4096
# }

# resource "local_file" "TF-key" {
#   content  = tls_private_key.rsa.private_key_pem
#   filename = "tfkey"
# }

# resource "aws_key_pair" "TF_key" {
#   key_name   = "TF-key"
#   public_key = tls_private_key.rsa.public_key_openssh
# }