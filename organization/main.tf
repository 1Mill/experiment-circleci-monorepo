module "secrets" {
	source = "./modules/secrets"

	AWS_PROFILE = var.AWS_PROFILE
	AWS_ACCESS_KEY_ID = var.AWS_ACCESS_KEY_ID
	AWS_SECRET_ACCESS_KEY = var.AWS_SECRET_ACCESS_KEY
}

output "testing_value" {
	value = module.secrets.testing
}

resource "aws_iam_group" "engineers" {
	name = "engineers"
}
