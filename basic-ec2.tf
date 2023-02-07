resource "aws_instance" "os1" {

  ami           = "ami-01a4f99c4ac11b03c"
  instance_type = "t2.micro"

  vpc_security_group_ids = [
    "sg-0877b56aefc9b0f1e"
  ]

  user_data = <<EOF
		#! /bin/bash
		yum install httpd -y
		echo "<h1>Deployed via Terraform</h1>" > /var/www/html/index.html
		systemctl enable httpd --now
		EOF

  tags = {
    Name = "TestOS1"
  }
}

output "ec2_instance_publicip" {
  description = "EC2 public ip"
  value       = aws_instance.os1.public_ip
}

