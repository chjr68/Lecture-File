terraform {
  backend "s3" {
    bucket = "nowagebs3"
    key    = "terraform.tfstate"
  }
}
