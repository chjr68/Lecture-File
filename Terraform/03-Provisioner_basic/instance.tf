# cf1) aws configure
# cf2) aws ec2 delete-key-pair --key-name mykey
# ssh-keygen -f ~/mykey
# terraform init
# terraform plan -out /tmp/p.out
# terraform apply -auto-approve
# cat terraform.tfstate|grep public_ip
# ssh -i ~/mykey ubuntu@13.209.73.61

# terraform destroy -auto-approve

resource "aws_key_pair" "mykey" {
  key_name   = "mykey"
  public_key = file("~/mykey.pub")
}

resource "aws_instance" "example" {
  ami           = "ami-03746875d916becc0"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.mykey.key_name
  root_block_device{
    volume_size   = 100
  }

  connection {
    user        = "ubuntu"
    private_key = file("mykey")
  }
  tags = {
    Name = "My Instance"
  }
}

provider "aws" {
  region = "eu-west-1"
}
