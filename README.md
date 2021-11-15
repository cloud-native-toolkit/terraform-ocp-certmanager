![Verify and release module](https://github.com/cloud-native-toolkit/terraform-ocp-certmanager/workflows/Verify%20and%20release%20module/badge.svg)


#  Certificate Manager terraform module

Deploys Jetstack cert-manager in RH OpenShift cluster.  This will create the namespace "cert-manager" automatically and install there.

## Supported platforms

- OCP 4.6+

## Module dependencies

The module uses the following elements

### Terraform providers

- null - used to run the shell scripts

### Environment

- kubectl - used to apply yaml 

## Suggested companion modules

The module itself requires some information from the cluster and needs a
namespace to be created. The following companion
modules can help provide the required information:

- Cluster - https://github.com/ibm-garage-cloud/terraform-cluster-ibmcloud

## Example usage

```hcl-terraform
module "dev_ocp_certmgr" {

  source = "github.com/cloud-native-toolkit/terraform-ocp-certmanager"

  cluster_config_file      = module.cluster.config_file_path
  cluster_type             = module.cluster.platform.type_code
  cluster_ingress_hostname = module.cluster.platform.ingress
  tls_secret_name          = module.cluster.platform.tls_secret
  
}
```

