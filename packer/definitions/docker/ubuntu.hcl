packer {
  required_plugins {
    docker = {
      version = ">= 0.0.7"
      source = "github.com/hashicorp/docker"
    }
  }
}

source "docker" "ubuntu" {
  image = "ubuntu:xenial"
  commit = true
}

build {
  name = "aros"
  sources = [
    "source.docker.ubuntu"
  ]

  provisioner "shell" {
    inline = [
      "touch /tmp/test",
      "echo 'AROS Image Builder: Updating package system'",
      "DEBIAN_FRONTEND=noninteractive apt-get update -qq < /dev/null > /dev/null",
      "echo 'AROS Image Builder: Installing pre-install support packages'",
      "DEBIAN_FRONTEND=noninteractive apt-get install -qq apt-utils < /dev/null > /dev/null",
      "DEBIAN_FRONTEND=noninteractive apt-get install -qq curl sudo < /dev/null > /dev/null",
      "curl -s https://raw.githubusercontent.com/airframesio/image-dietpi/main/scripts/remote-install.sh | sh"
    ]
  }
}
