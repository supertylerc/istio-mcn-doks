# istio-mcn-doks

This repository includes configuration for a deploying multiple
DigitalOcean-based Kubernetes clusters, primarily for the purpose of
experimenting with Istio multi-cluster mesh (though no Istio-specific
configurations are applied).

First, ensure you have Terraform installed.  The
[official instructions][install-terraform] are succint and cover more
platforms than I could, so go [check them out][install-terraform] if you
don't already have Terraform installed.  You'll also need
[terragrunt][terragrunt], which, again, the
[official install docs][install-terragrunt] are better than anything I
could write.

You also need to export your DigitalOcean API token and Google Cloud
credentials (as JSON) to environment variables:

```bash
$ export DIGITALOCEAN_TOKEN="example-token-here"
$ export GOOGLE_CREDENTIALS=$(cat ~/Downloads/istio-mcn-doks-abcdef123.json | tr -s '\n' ' ') 
```

> For information on how to generate a DO API token, see the
> [official docs][dotokendocs].

Next, initialize and review the infrastructure plan:

```bash
$ terragrunt run-all init
$ terragrunt run-all plan
```

If the plan looks good to you, then start the process of creating the
infrastructure:

```bash
$ terragrunt run-all apply
```

This process can take up to 10-15 minutes.  It will create (by default)
a VPC and single-node managed Kubernetes cluster in the `tor1` and
`nyc3` regions.  It will also create a firewall and make your clusters
default deny for inbound and outbound traffic (other than what the
managed service itself opens, which you cannot override).  Holes are
poked for outbound DNS, HTPS, and HTTPS traffic.  No inbound holes are
created; you will need to do that yourself (for now).  In the future,
this repo may support specifying custom firewall rules.

[minikube]: https://minikube.sigs.k8s.io/docs/
[install-terraform]: https://www.terraform.io/downloads
[dotokendocs]: https://docs.digitalocean.com/reference/api/create-personal-access-token/
[terragrunt]: https://terragrunt.gruntwork.io/
[install-terragrunt]: https://terragrunt.gruntwork.io/docs/getting-started/install/
