variable "REGISTRY" {
  default = "ghcr.io/pork-ops"
}

variable "TAG" {
  default = "latest"
}

target "image-one" {
  context    = "."
  dockerfile = "dockerfiles/image-one/Dockerfile"

  args = {
    MESSAGE = "hello from image-one"
  }

  platforms = [
    "linux/amd64",
    "linux/arm64",
  ]

  tags = ["${REGISTRY}/docker-bake-image-one:${TAG}"]
}

target "image-two" {
  context    = "."
  dockerfile = "dockerfiles/image-two/Dockerfile"

  args = {
    MESSAGE = "hello from image-two"
  }

  platforms = [
    "linux/amd64",
    "linux/arm64",
  ]

  tags = ["${REGISTRY}/docker-bake-image-two:${TAG}"]
}

group "default" {
  targets = [
    "image-one",
    "image-two",
  ]
}
