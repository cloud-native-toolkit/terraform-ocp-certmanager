locals {
  bin_dir = module.setup_clis.bin_dir
  tmp_dir = "${path.cwd}/.tmp"
}


# cert-manager
resource "null_resource" "deploy_cert-manager" {
  triggers = {
    kubeconfig = var.cluster_config_file
  }

  provisioner "local-exec" {
    command = "${path.module}/scripts/deployCertManager.sh"

    environment = {
      KUBECONFIG = self.triggers.kubeconfig
    }
  }

  provisioner "local-exec" {
    when = destroy
    command = "${path.module}/scripts/deployCertManager.sh destroy"

    environment = {
      KUBECONFIG = self.triggers.kubeconfig
    }
  }
}



