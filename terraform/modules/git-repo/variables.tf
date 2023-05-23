variable "repo" {
  description = "Configuration of github repo"
  type = object({
    name = string
    description = string
  })
}
