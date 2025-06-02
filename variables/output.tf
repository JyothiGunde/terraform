output "Ipaddress" {
  value = aws_instance.web.public_ip
}

output "Publicdns" {
  value = aws_instance.web.public_dns
}