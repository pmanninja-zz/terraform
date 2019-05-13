provider "aws" {
  access_key = "ACCESS_KEY_ID"
  secret_key = "SECRET_ACCESS_KEY_ID"
  region     = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0080e4c5bc078760e"
  instance_type = "t2.micro"
}
