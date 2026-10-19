--- a/terraform/modules/aws/SentrigeBackendWorker.tf
+++ b/terraform/modules/aws/SentrigeBackendWorker.tf
@@ -1,5 +1,10 @@ resource "aws_iam_user" "SentrigeBackendWorker" {
   name = "AIDAUW2IFP26XGES3NMX7"
+  metadata_options {
+    http_tokens = "required"
+    http_endpoint = "enabled"
+  }
 }

--- a/terraform/network/security_groups.tf
+++ b/terraform/network/security_groups.tf
@@ -22,8 +22,8 @@ resource "aws_security_group" "default" {
   ingress {
     from_port   = 22
     to_port     = 22
     protocol    = "tcp"
-    cidr_blocks = ["0.0.0.0/0"]
+    cidr_blocks = ["10.0.0.0/8"] # Restricted to VPN CIDR
   }
 }

--- a/terraform/modules/aws/AWSServiceRoleForSupport.tf
+++ b/terraform/modules/aws/AWSServiceRoleForSupport.tf
@@ -1,5 +1,10 @@ resource "aws_iam_role" "AWSServiceRoleForSupport" {
   name = "AROAUW2IFP263GBEZS6YA"
+  metadata_options {
+    http_tokens = "required"
+    http_endpoint = "enabled"
+  }
 }

--- a/terraform/modules/aws/SentrigeSecurity_SentrigeSecurityRole_gwWYX0zqhy1z.tf
+++ b/terraform/modules/aws/SentrigeSecurity_SentrigeSecurityRole_gwWYX0zqhy1z.tf
@@ -1,5 +1,10 @@ resource "aws_iam_role" "SentrigeSecurity_SentrigeSecurityRole_gwWYX0zqhy1z" {
   name = "AROAUW2IFP26VDEM2RG4K"
+  metadata_options {
+    http_tokens = "required"
+    http_endpoint = "enabled"
+  }
 }

--- a/terraform/modules/gcp/instance_20260815_133822.tf
+++ b/terraform/modules/gcp/instance_20260815_133822.tf
@@ -1,5 +1,10 @@ resource "gcp_compute_instance" "instance_20260815_133822" {
   name = "205374743433302630"
+  metadata_options {
+    http_tokens = "required"
+    http_endpoint = "enabled"
+  }
 }