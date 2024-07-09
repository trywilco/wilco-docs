---
title: Sidebar Tools
parent: Building Your Quest
---

# Sidebar Tools
A sidebar tool is a link displayed in the Snack sidebar during a quest. It can be used to link to an external tool that is part of the quest.

```yaml
sidebarTools:
  - name: the name of tool that will be displayed on snack | mandatory
    link: the URL that will be opened when clicking on the tool, can be a template string or a url | mandatory
    visible: a template string to decide when to show the tool | optional
    icon: a filename for an icon that is located in the assets folder | optional
    enabled: a template string to decide when the tool is enabled | optional
```
## Usage Example
```yaml
sidebarTools:
  - name: External Tool 
    link: ${user.repository} 
    visible: ${user.properties.proptest}
    icon: chat.svg 
    enabled: ${!!user.repository}
```
