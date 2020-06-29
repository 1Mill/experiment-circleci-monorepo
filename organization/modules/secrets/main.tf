variable "file_name" {
	type = string
}

provider "sops" {
	version = "~> 0.5.1"
}

data "sops_file" "default" {
  	source_file = "${path.cwd}/secrets/${var.file_name}"
}

output "data" {
	value = data.sops_file.default.data
}
