terraform {
  backend "s3" {
    bucket = "my-buk3"
    key    = "jenkins/terraform.tfstate"
    region = "us-east-1"
  }
}
