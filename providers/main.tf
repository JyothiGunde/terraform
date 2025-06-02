#create an ec2 instance

resource "aws_instance" "web" {
    ami = "ami-0953476d60561c955"
    instance_type = "t2.micro"

    tags = {
        Name = "HelloWorld"
    }
}

resource "github_repository" "example" {
    name = "terraform"
    description = "to learn terraform"

    visibility = "public"
}
