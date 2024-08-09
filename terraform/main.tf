resource "aws_instance" "web" {
  count           = 2
  ami             = "ami-09c78c91d944d3be1"
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.main.id
  security_groups = [aws_security_group.allow_ssh.name]

  key_name = "/home/patrick/ansible/aws_key.pub" # SSH Key

  user_data = file(install_python.sh) # ruft das Script zu Python installation auf und führt dieses aus 

  tags = {
    Name = "Ansible-Prepared-Debian-Instance-${count.index}"
  }
}

output "instance_ips" {
  value = aws_instance.web.*.public_ip
}