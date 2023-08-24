output "PrimaryELB" {
	value = aws_elb.primary-elb.dns_name
}

output "SlaveryELB" {
	value = aws_elb.slavery-elb.dns_name
}
