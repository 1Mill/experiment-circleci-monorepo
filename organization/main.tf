data "sops_file" "secrets" {
  	source_file = "secrets.sops.json"
}

output "testing" {
	value = data.sops_file.secrets.data["testing"]
}

resource "aws_iam_group" "engineers" {
	name = "engineers"
}
