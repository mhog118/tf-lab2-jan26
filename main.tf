provider "aws" {
    region = "us-west-1"
}

resource "aws_instance" "vm01"{
  count = var.num_of_vm
  monitoring = var.monitoring 
  
  ami = var.ami_id
  instance_type = var.instance_type

  subnet_id = var.subnets[count.index]

  tags = {
    Name = var.tag_names[count.index]
    Owner = var.tag_owner
  }
}


