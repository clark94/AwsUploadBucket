#Quando eu começar um codigo no Terratranformers eu preciso setar primeiramente o provider e a pasta para armazenar o .tfstate , lembrando que para subir o arquivo
#Normalmente você coloca a senha no provider (pelo que eu me lembro a ordem no terraform não importa o importante são as informações estarem no local certo)

provider "aws" {
  region = "us-east-2"

}

terraform {
  backend "s3" {
    bucket = "terraformtransformers"
    key    = "state/terraform.tfstate2"
    region = "us-east-2"
  }
}


