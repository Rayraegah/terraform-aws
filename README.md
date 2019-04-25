# Terraform Modules

These are terraform modules to orchestrate and manage infrastructure with AWS provider. This project contains the module definitions and circleci deployment configurations.

The modules in this project can be used to provision:

-   [x] ACM certificate
-   [x] Static website
    -   [x] S3 bucket for static hosting
    -   [x] CloudFront distribution for serving static site over SSL
    -   [x] Route53 for routing the domain name to the correct location

## Requirements

-   AWS account
    -   IAM user
    -   domain with Route53
-   Terraform

## Usage

To install terraform [follow the instructions](https://learn.hashicorp.com/terraform/getting-started/install.html) on terraform's installation page.

Install `awscli` locally using homebrew (on macOS) or python.


```bash
brew install awscli
```

or 

```bash
python --version
2.7

pip install awscli
```

After awscli is installed, initalize and configure awscli with `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`.

Then create a `main.tf` file in your project root directory and copy the code from the instructions below.

### Define provider

First define the provider as `aws`. This will download terraform's aws dependencies. This is a required step.

```terraform
provider "aws" {
  region = "ap-northeast-1" # Tokyo
}
```

### Define zone

Defining zone helps with route management. This is also a required step.

```terraform
resource "aws_route53_zone" "site_zone" {
  name = "rayraegah.com" # your zone
}
```

### Define static site

```terraform
module "blog" {
  source              = "github.com/rayraegah/terraform-aws//static_site"
  bucket_name         = "static-rayraegah.com"
  domain              = "rayraegah.com"
  zone_id             = "${aws_route53_zone.site_zone.zone_id}"
  acm_certificate_arn = "${module.acm.certificate_arn}"
}
```

## Orchestrate

In the folder where your `main.tf` file is located run the following commands to download all provider dependencies and preview the infrastructure:

```bash
terraform init
terraform plan
```

To create the infrastructure use `apply` command.

```bash
terraform apply
```

This will create (destory and create if already exists) the planned infrastructure. All commands are safe to run.

## Maintainers

-   [Rayraegah](https://github.com/rayraegah)
-   (include your name here if you contribute to this repo)

## License

See [LICENSE](./LICENSE) file
