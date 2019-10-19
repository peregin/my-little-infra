output "public_ip" {
  value       = aws_instance.web.public_ip
  description = "The public IP of the web server"
}

output "public_dns" {
  value       = aws_instance.web.public_dns
  description = "The public DNS of the web server"
}

output "availability_zone" {
  value       = aws_instance.web.availability_zone
  description = "Availability zone of the region"
}