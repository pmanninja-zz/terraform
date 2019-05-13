provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "test" {
  count         = 1
  ami           = "ami-2d39803a"
  instance_type = "t2.micro"

  tags {
    Name = "terraform-test ${count.index}"
  }

  vpc_security_group_ids = ["${aws_security_group.instance.id}"]
  subnet_id              = "subnet-0c1631d74091ac247"
}

resource "aws_security_group" "instance" {
  vpc_id = "vpc-013f49bf900c4e52d"
}

resource "aws_autoscaling_group" "test" {
  //this is to extract values from the the created
  launch_configuration = "${aws_instance.test.ami}"

  min_size = "${var.min_size}"

  max_size = "${var.max_size}"
}

output "asg_name" {
  value = "${aws_autoscaling_group.test.name}"
}
