
# Packer

More information on Packer can be found at https://www.packer.io/

Documentation for Packer can be found here: https://www.packer.io/docs/index.html

## Exercises

The goal of this exercise is to create an AWS AMI image with Jenkins installed.

- Change the AMI name to something that you can identify.

  *Everyone will create AMI images in the same region, so make sure to use a name
that enables you to easily trace your images.*

  *And remember, it is easier to make the name of the image descriptive.*

- Navigate to the directory where `ami.json` was downloaded.

- Run `packer validate` to validate the packer code.

- Run `packer build` to build you AMI. Check in the AWS console for the newly creaated  ami (make sure that you are in the correct region).
