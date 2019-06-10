provider "aws" {
  region = "us-east-1"
}

resource "random_string" "password" {
  length  = 11
  special = false
  //override_special = "!#%^&*()[]{}+=-<>?:;"
}

output "password" {
  value = random_string.password.result
}

/*
resource "aws_kms_key" "key" {
  description = "sand-meridian-secret-key"
  enable_key_rotation = false
  key_usage = "ENCRYPT_DECRYPT"
  is_enabled = true
  policy = file("./key.json")
}

resource "aws_kms_alias" "alias" {
  name          = "alias/meridian-key"
  target_key_id = "${aws_kms_key.key.key_id}"
}
//test or arn:aws:kms:us-east-1:767090234737:key/93424908-4084-4c56-9b6e-a6f7258afe17

resource "aws_secretsmanager_secret" "secret" {
  name = "password-secret"
  kms_key_id = aws_kms_key.key.arn //"arn:aws:kms:us-east-1:767090234737:key/93424908-4084-4c56-9b6e-a6f7258afe17"
}

resource "aws_secretsmanager_secret_version" "password" {
  secret_id = aws_secretsmanager_secret.secret.id
  secret_string = random_string.password.result //jsondecode(random_string.password.result)
  
}

data "aws_iam_policy_document" "kms_use" {
  statement {
    sid = "AllowKMSUse"
    effect = "Allow"
    actions = [
      "kms:Encrypt",
      "kms:Decrypt",
      "kms:ReEncrypt*",
      "kms:GenerateDataKey*",
      "kms:DescribeKey",
    ]
    resources = [
      aws_kms_key.key.arn,
    ]
  }
}

resource "aws_iam_policy" "kms-use" {
  name = "kmsuse"
  policy = data.aws_iam_policy_document.kms_use.json
}
resource "aws_iam_role_policy_attachment" "attach-to-role" {
  role = "test-key-role"
  policy_arn = aws_iam_policy.kms-use.arn
}

resource "aws_iam_policy_attachment" "test-attach" {
  name       = "test-attachment"
  users      = ["Nicole","Pj"]
  roles      = ["test-key-role"]
  //groups     = ["${aws_iam_group.group.name}"]
  policy_arn = aws_iam_policy.kms-use.arn
}
*/
// $aws secretsmanager put-resource-policy --secret-id SECRET_NAME --resource policy file://RESOURCE_POLICY.json