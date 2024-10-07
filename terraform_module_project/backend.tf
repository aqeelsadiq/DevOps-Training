terraform {
  backend "s3" {
    bucket = "bucket_name"
    key    = "terraform.tfsate"
    region = "region"
    dynamodb_table = "name_of_table"
  }
}
