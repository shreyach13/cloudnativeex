provider "aws" {
  region = "us-east-1"
}

data "aws_ami" "shreya-jenkins-server" {
  most_recent = true
  filter {
    name   = "name"
    values = ["shreya-jenkins-server*"]
  }
  owners = [var.aws_account_owner]
}

resource "aws_key_pair" "Shreya_KP" {
  key_name   = "Shreya_KP"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD1GZGg7GR8Bi/Gzd688jvIaPx82MeXhCMlQ/W66Cj33wZEYp7BfkEkIp6IbLjyrWlXwvvSINeyhuZrnn6tePK1NtOFrjPlMVHof8yWNQg80GCnhSOBQBkwf4W9vEfb0z6ERB9dwKn9OrVSQeOFwto7wF2xtvSZc+0SYtaiEKxRrtdcZdrvwkul0jNJ+yFdSeQ0UCG1Jbm4SVddYjLQm4eD6y9NxyrYpwCo/BVTifHA/Y7Nl7WWQ4hdFugLzv1d6E0vje2ID+nGuza0+ArP3J0UAzviWvDgGDAolXay9LZvbvwoCsGvZuVqhubB73wHZ6Igsr+QGwgeDUzJDmJvkqKH shreyachatterjee@shreyas-mbp.clients.europe.shell.com"
}

resource "aws_instance" "shreya-jenkins-webserver" {
  ami           = "${data.aws_ami.shreya-jenkins-server.id}"
  instance_type = "t2.micro"
  /*iam_instance_profile = var.iam_role*/
  key_name = "Shreya_KP"
  security_groups = [
    var.my_security_group
  ]
  tags = {
    Name  = "Shreya Jenkins Server"
    owner = var.owner
  }
}
