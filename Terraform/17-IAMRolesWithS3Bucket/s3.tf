resource "aws_s3_bucket" "b" {
    bucket = "mybucket-jg11"
    acl = "private"

    tags = {
        Name = "mybucket-jg11"
    }
}
