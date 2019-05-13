terraform{
    backend "s3" {
       bucket = "nutrien-sandbox-terraform-state"
       key = "PJ-test-terraform.tfstate"
       region = "us-east-1" 
    }
}