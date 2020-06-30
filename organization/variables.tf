variable "AWS_PROFILE" {
	type = string
}
variable "AWS_ACCESS_KEY_ID" {
	type = string
}
variable "AWS_SECRET_ACCESS_KEY" {
	type = string
}

variable "USERNAMES" {
	default = []
	type = set(string)
}
