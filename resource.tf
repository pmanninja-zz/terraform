provider "aws" {
    region = "us-east-1"
}

terraform{
    backend "s3" {
       bucket = "nutrien-sandbox-terraform-state"
       key = "PJ-test-terraform.tfstate"
       region = "us-east-1" 
    }
}

resource "aws_instance" "test" {
    count = 1
    ami = "ami-2d39803a"
    instance_type = "t2.micro"

    tags{
          Name = "terraform-test ${count.index}"
    }
    vpc_security_group_ids = ["${aws_security_group.instance.id}"]
    subnet_id = "subnet-0c1631d74091ac247"
}

resource "aws_security_group" "instance" {
    vpc_id = "vpc-013f49bf900c4e52d"
}