resource "aws_s3_bucket" "spyder" {
    bucket = "manspyderup"
    }

  resource "aws_s3_bucket_versioning" "spyder" {
  bucket = aws_s3_bucket.spyder.id
  versioning_configuration {
    status = "Suspended"
  }
}

resource "aws_s3_bucket" "import" {
    bucket = "devopdup"
    }

    resource "aws_s3_bucket_versioning" "import" {
  bucket = aws_s3_bucket.import.id
  versioning_configuration {
    status = "Suspended"
  }
}