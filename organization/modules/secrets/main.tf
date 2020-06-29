provider "sops" {
	version = "~> 0.5.1"
}

variable "AWS_PROFILE" {
	type = string
}
variable "AWS_ACCESS_KEY_ID" {
	type = string
}
variable "AWS_SECRET_ACCESS_KEY" {
	type = string
}

data "sops_file" "default" {
  	source_file = "${path.cwd}/secrets/secrets.sops.json"
}

output "testing" {
	value = data.sops_file.default.data["testing"]
}
