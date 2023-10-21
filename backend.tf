terraform {
  backend "s3" {
    bucket = "demo-cls"
    key = "main"
    region = "ap-south-1"
    dynamodb_table = "my-dynamo-table"
  }
}
