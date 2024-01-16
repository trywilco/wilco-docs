---
title: K8s
parent: Quest Resources
grand_parent: Building Your Quest
nav_order: 2
---

# Kubernetes

Wilco allows you to use a Kubernetes cluster as an attached resource in your quest. This way your quest can interact with the cluster
for deploying applications, creating custom resources, reading metrics, getting pod information etc.

## Hosting

The Kubernetes cluster will be hosted and managed by Wilco. It is fully transparent to the quest user. You can either interact with it
via other quest resources or via any external Kubernetes tool by using the provided kubeconfig file (explained below).

{: .important }
The cluster is locked down and you only get access on a single namespace. Don't do any serious/production work on the cluster. There are no backups of any kind. The cluster uses real cloud resources. Please be mindful of how you use it.


## Declaration

**Type**: Quest Resources

To use a Kubernetes cluster in your quest include the following snippet in your `quest.yml` file


  
```yaml
resources:
  - name: k8s
    config:
      deploy: true
      clear:
        secrets:
        - new-relic-license-key
```

When specified as a resource, a fully functional K8s namespace will be created for the quest.

Supported properties:

- **config:** 
    deploy: true | false. Allows auto deploy after PR is merged.
    clear:
      secrets: The list of secrets to remove.

This example will remove the `new-relic-license-key` secret upon the start of a quest and configure auto-deploy after every push to main.

## Usage

Note that even though the cluster is now available to your quest it is your responsibility to obtain/install the respective tools such as kubectl/helm in order to work with it.

In the quest resource you will now also see a Kubeconfig file

![kubeconfig]


Users can download the kubeconfig file and use it with any compliant Kubernetes tool.

## Example quests

Quests that use Kubernetes integration
  
 * [To the cloud and beyound](https://app.wilco.gg/explore/quest/kubernetes)
 * [Enable Continuous deployment](https://app.wilco.gg/explore/quest/armory_cdaas_enable_continuous_deployment)

 [kubeconfig]: {% link assets/images/building-your-quest/kubeconfig.png %}