---
title: Kubernetes
parent: Quest Resources
grand_parent: Building Your Quest
---

# kubernetes

Description: Hosting user's backend and frontend apps

When specified as a resources, a fully functional K8s namespace will be created for the frontend and configured for the user. 


Supported properties:

- **config:** 
    deploy: true | false. Allow auto deploy after PR is merged.
    clear:
      secrets: 
       - secret-name: delete the secret fron the namespace

```yaml
resources:
  - name: k8s
    config:
      deploy: true
      clear:
        secrets:
        - new-relic-license-key
```

This example will remove `new-relic-license-key` upon quest start, and also configured auto-deploy after every push to main.
