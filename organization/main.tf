module "secrets" {
	source = "./modules/secrets"
}

output "testing_value" {
	value = module.secrets.testing
}

resource "aws_iam_group" "engineers" {
	name = "engineers"
}
