provider "aws" {
  region                  = "us-east-1"
  profile                 = "terraform-user"
}

provider "aws" {
  region     = "us-west-2"
  access_key = "ENTER-YOUR-ACCESS-KEY"
  secret_key = "ENTER-YOUR-SECRET-KEY"
}

resource "aws_eip" "public_ip" {
   vpc      = true
}

#provider_property.user-defined-name.

output "ec2_public_ip" {
   value = "${aws_eip.public_ip.public_ip}"
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "terraform-test-kplabs-02"
}

output "bucket_identifier" {
  value = "${aws_s3_bucket.my_bucket.bucket_domain_name}"
}

provider "aws" {

  region     = "us-west-2"
  access_key = "YOUR-KEY-HERE"
  secret_key = "YOUR-KEY-HERE"
}

resource "aws_eip" "myeip" {
   vpc      = true
}

resource "aws_security_group" "allow_all" {

  name        = "interpolation-demo"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["${aws_eip.myeip.public_ip}/32"]
  }
}
