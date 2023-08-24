resource "aws_instance" "example" {
  ami           = lookup(var.AMIS, var.AWS_REGION)
  instance_type = "t2.micro"
  provisioner "local-exec" {
    command = "echo private ip ${aws_instance.example.private_ip} >> private_ips.txt"
  }
}
output "public_ip" {
  value = aws_instance.example.public_ip
}
