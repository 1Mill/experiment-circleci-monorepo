terraform {
	required_version = "~> 0.12.28"

	backend "s3" {
		// profile = ENVIRONMENT AWS_PROFILE
		region = "us-east-1"

		// access_key = ENVIRONMENT AWS_ACCESS_KEY_ID
		// secret_key = ENVIRONMENT AWS_SECRET_ACCESS_KEY

		bucket = "experiment-terraform-state"
		dynamodb_table = "experiment-terraform-state-locks"
		encrypt = true
		key = "global/s3/terraform.tfstate"
	}
}
