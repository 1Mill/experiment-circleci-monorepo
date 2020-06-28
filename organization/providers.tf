provider "aws" {
	profile = var.AWS_PROFILE
	region = var.AWS_REGION

	access_key = var.AWS_ACCESS_KEY_ID
  	secret_key = var.AWS_SECRET_ACCESS_KEY

	version = "~> 2.0"
}
