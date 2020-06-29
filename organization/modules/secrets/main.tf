provider "sops" {
	version = "~> 0.5.1"
}

data "sops_file" "default" {
  	source_file = "${path.cwd}/secrets/secrets.sops.json"
}

output "testing" {
	value = data.sops_file.default.data["testing"]
}
