resource "aws_s3_bucket" "b10" {
  bucket = "s3-terraform-bucket-lab-1"
  acl    = "private"

  tags = {
    IES   = "IGTI",
    CURSO = "EDC"
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}


#Crio um objeto e atrelo ao bucket que eu criei e coloco etag para caso ele veja que o md5 mudou caso o contrário ele sobre
resource "aws_s3_bucket_object" "object" {

  bucket = aws_s3_bucket.b1.id

  key = "profile"

  acl = "private" # or can be "public-read"

  source = "../data/func.csv"

  etag = filemd5("../data/func.csv")

}




