provider "aws" {
  region = "eu-central-1"
}

data "aws_ami" "jenkins-ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["DSW-Jenkins-Image*"]
  }

  owners = [var.aws_account_owner]
}

resource "aws_key_pair" "dsw-key" {
  key_name   = "dsw-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC35UZ0QppmFGLZLH3knvhMCZwrBayIgpDX9qah+7XCurDZ15Bs3x2gumTg4En9CXQrJn+DDj3l999HdmHqU/sY8Q13PqSHKeeFXOSCGWRH3rLPsC4eH+GhVM9dOS5O4dyutuS19SLoB/3khjboPaB52kBOGGsoNPL0K2j/K7uy4HJ6mKpBLZfnn9YUrgvTrho9R4FIkA8wudl5HCZjz5RP3XwIxJpaqmLjxzbe4nxHT/0LegTYIkFsIPjrNEt4nGoD8h892h79zxlhP/qwcQ4gcsUG5gC/T+TPb3kzHkh4fQfiUKHg0aKcXRlBf44oN0J+iR1DugNNcT5lfXkTPme9 dswilkinson@me.com"
}

resource "aws_instance" "webserver" {
  ami           = "${data.aws_ami.jenkins-ami.id}"
  instance_type = "t2.micro"
  /*iam_instance_profile = var.iam_role*/
  key_name = "dsw-key"
  security_groups = [
    var.my_security_group
  ]
  tags = {
    Name  = "DSW Jenkins Server"
    owner = var.owner
  }
}
