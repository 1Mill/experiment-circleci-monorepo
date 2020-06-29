module "secrets" {
	source = "./modules/secrets"

	file_name = "secrets.sops.json"
}

output "testing_value" {
	value = module.secrets.data["testing"]
}

resource "aws_iam_group" "engineers" {
	name = "engineers"
}
resource "aws_iam_instance_profile" "testing" {
	name = "delete-this-if-you-see-it"
}
