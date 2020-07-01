module "usernames" {
	source = "./modules/secrets"

	file_name = "usernames.sops.json"
}
output "account_names" {
	value = module.usernames.json.usernames
}

data "aws_iam_policy" "administrator_access" {
	arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
resource "aws_iam_group" "engineering" {
	name = "engineering-department"
}
resource "aws_iam_group_policy_attachment" "engineering" {
	group = aws_iam_group.engineering.name
	policy_arn = data.aws_iam_policy.administrator_access.arn
}
resource "aws_iam_user" "engineer" {
	for_each = var.USERNAMES

	name = each.value
}
resource "aws_iam_group_membership" "engineer" {
	group = aws_iam_group.engineering.name
	name = "${aws_iam_group.engineering.name}-membership"
	users = [for u in aws_iam_user.engineer : u.name]
}
