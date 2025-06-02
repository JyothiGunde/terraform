
resource "aws_instance" "web" {
    ami = var.os
    instance_type = var.size

    tags = {
        name = var.name
    }
}

resource "aws_s3_bucket" "mybucket" {
  bucket = var.bucketname
}

resource "aws_iam_user" "user" {
  name = "${var.username}-user"
}