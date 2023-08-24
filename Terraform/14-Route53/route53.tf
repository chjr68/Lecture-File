resource "aws_route53_zone" "finfra-com" {
   name = "finfra.com"
}
resource "aws_route53_record" "server1-record" {
   zone_id = aws_route53_zone.finfra-com.zone_id
   name = "server1.finfra.com"
   type = "A"
   ttl = "300"
   records = ["123.123.123.123"]
}
resource "aws_route53_record" "www-record" {
   zone_id = aws_route53_zone.finfra-com.zone_id
   name = "www.finfra.com"
   type = "A"
   ttl = "300"
   records = ["123.123.123.123"]
}
resource "aws_route53_record" "mail1-record" {
   zone_id = aws_route53_zone.finfra-com.zone_id
   name = "finfra.com"
   type = "MX"
   ttl = "300"
   records = [
     "1 aspmx.l.google.com.",
     "5 alt1.aspmx.l.google.com.",
     "5 alt2.aspmx.l.google.com.",
     "10 aspmx2.googlemail.com.",
     "10 aspmx3.googlemail.com."
   ]
}

output "ns-servers" {
   value = aws_route53_zone.finfra-com.name_servers
}
