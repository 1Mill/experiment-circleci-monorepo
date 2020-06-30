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
resource "aws_iam_user" "some_user" {
	for_each = var.USERNAMES

	name = each.value
}
