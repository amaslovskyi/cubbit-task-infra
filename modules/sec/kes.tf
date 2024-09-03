#IAM policy for accessing Secrets Manager
resource "aws_iam_policy" "secrets_manager_access" {
  name        = "secrets-manager-access"
  path        = "/"
  description = "IAM policy for accessing Secrets Manager"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "secretsmanager:GetSecretValue",
          "secretsmanager:DescribeSecret"
        ]
        Resource = "arn:aws:secretsmanager:${var.region}:${data.aws_caller_identity.current.account_id}:secret:*"
      },
    ]
  })
}

resource "helm_release" "external_secrets" {
  name             = "external-secrets"
  version          = "0.10.1"
  repository       = "https://charts.external-secrets.io"
  chart            = "external-secrets"
  namespace        = "external-secrets"
  create_namespace = true

  set {
    name  = "installCRDs"
    value = "true"
  }

  values = [
    <<EOF
    resources:
      limits:
       cpu: 150m
       memory: 200Mi
      requests:
        cpu: 50m
        memory: 128Mi
      EOF
  ]

}

# Kubernetes Secret for AWS Credentials
resource "kubernetes_manifest" "aws_credentials" {
  manifest = {
    apiVersion = "v1"
    kind       = "Secret"
    metadata = {
      name      = "aws-credentials"
      namespace = "external-secrets"
    }
    type = "Opaque"
    data = {
      accessKeyID     = base64encode("your-access-key-id")
      secretAccessKey = base64encode("your-secret-access-key")
    }
  }
}

resource "kubernetes_manifest" "secret_store" {
  manifest = {
    apiVersion = "external-secrets.io/v1alpha1"
    kind       = "SecretStore"
    metadata = {
      name      = "aws-secrets-manager"
      namespace = "external-secrets"
    }
    spec = {
      provider = {
        aws = {
          service = "SecretsManager"
          region  = "us-west-2"
          auth = {
            secretRef = {
              accessKeyIDSecretRef = {
                name = "aws-credentials"
                key  = "accessKeyID"
              }
              secretAccessKeySecretRef = {
                name = "aws-credentials"
                key  = "secretAccessKey"
              }
            }
          }
        }
      }
    }
  }
}

# ExternalSecret to sync secrets from AWS Secrets Manager
resource "kubernetes_manifest" "external_secret" {
  manifest = {
    apiVersion = "external-secrets.io/v1alpha1"
    kind       = "ExternalSecret"
    metadata = {
      name      = "my-secret"
      namespace = "external-secrets"
    }
    spec = {
      refreshInterval = "1h"
      secretStoreRef = {
        name = "aws-secrets-manager"
        kind = "SecretStore"
      }
      target = {
        name           = "my-k8s-secret"
        creationPolicy = "Owner"
      }
      data = [
        {
          secretKey = "my-secret-key"
          remoteRef = {
            key      = "my-aws-secret"
            property = "my-secret-property"
          }
        }
      ]
    }
  }
}
