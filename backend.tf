terraform {
  backend "s3" {
    bucket = "my-prasad2329-bucket"
    key = "main"
    region = "ap-south-1"
    dynamodb_table = "my-dynamo-table"
  }
}
