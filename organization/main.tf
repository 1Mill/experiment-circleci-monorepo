module "usernames" {
	source = "./modules/secrets"

	file_name = "usernames.sops.json"
}

data "aws_iam_policy" "administrator_access" {
	arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_group" "engineering" {
	name = "engineering-department"
}
resource "aws_iam_group_membership" "engineer" {
	group = aws_iam_group.engineering.name
	name = "${aws_iam_group.engineering.name}-membership"
	users = [for u in aws_iam_user.engineer : u.name]
}
resource "aws_iam_group_policy_attachment" "engineering" {
	group = aws_iam_group.engineering.name
	policy_arn = data.aws_iam_policy.administrator_access.arn
}
resource "aws_iam_user" "engineer" {
	for_each = toset(module.usernames.json.usernames)

	force_destroy = true
	name = each.value
}
