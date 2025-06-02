#This is single line comment

/* This is multi
line
comment 

Blocks
A block is a container for other content
Blocks are defined by their type and enclosed in curly braces

resource "aws_instance" "web" {
    ami = "ami-788989890"
    count = 3
    instance_type = "t2.micro"
}

Attributes
Key = value

Data type
type = "string"
number = 2
boolean = true

List
list = ["item1", "item2", "item3"] sg, subnets, AZ

Maps 

variable "example_map" {
    type = map
    default = { key1 = "value1", key2 = "value2"}
}

locals {
    my_map = { "name" = "john", "age" = 30, "is_admin" = true }
}

age_of_john = locals.my_map["age"]

conditions

resource "aws_instance" "server" {
    instance_type = var.environment == "development" ? "t2.micro" : "t2.small"
}

Function


locals {
    name = "John cena"
    fruits = ["apples", "bananas", "mangoes"]
    message = "Hello ${upper(local.name)}! I know you like ${join(",", local.fruits)}"
}

#Hello JOHN CENA! I know you like apples, bananas, mangoes

#resourcedependency
resource "aws_instance" "server" {
    vpc_security_group_ids = aws_security_group.mysg.id
}

resource "aws_security_group" "mysg" {
    #inbound rules
}
*/