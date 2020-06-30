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
resource "aws_iam_user" "engineer" {
	for_each = var.USERNAMES

	name = each.value
}
resource "aws_iam_group_membership" "engineer" {
	group = aws_iam_group.engineers.name
	name = "engineering-group-membership"
	users = [for u in aws_iam_user.engineer : u.name]
}
