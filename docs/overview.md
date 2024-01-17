---
title: Overview
nav_order: 3
---
# Wilco Overview

Wilco is a learning platform that allows you to create hands-on virtual labs for training your users, friends, prospects etc.
These documentation pages explain how you can use Wilco to create your own learning track - called "quest" in Wilco parlance.

If you just want to experience Wilco as an end user and browse our catalog or public quests visit the [main website](https://www.trywilco.com/)

## The Wilco experience

Unlike other learning platforms, Wilco has chosen a playful and interactive experience using a "Slack-like" interface
where players/students can interact with a virtual assistant instead of reading massive walls of text.

![snack]

The player talks with the virtual assistant to learn about the task at hand and can answer questions or notify the assistant
when a task is finished.

The actual task is accomplished in a different system. For several of our quests we use Codespaces, but this is not a strict requirement.

## Quest building blocks

All components of a quest can be described in files and you can store them in a Git repository for better organization and management. The basic components of a quest are:

* A `quest.yml` file that describes what your quest does and its dependencies
* Resources that your quest needs such as a database, a queue, a Kubernetes cluster, a VM etc
* A [Workspace] (e.g. source code and other files) for the user to perform the tasks required
* The quest text that contain the instructions presented to the user.
* Any additional actions that need to happen before or after a task

For more details on the individual files check [Building Your Quest].

## Monitoring progress

The highlight feature of Wilco is the interactive communication that happens with the virtual assistant. Instead of blindly
executing tasks the player can actually see if the result of a task is correct. The virtual assistant can perform 
checks during the quest to verify what the player did.

![check]

Checks can be very simple such as asking the player itself something or checking if a file was created or performing an API call and getting the results. As a quest author can make checks as powerful as you want.

## Creating your own quest

To create your own quest you need to do the following:

1. Create all your quest assets (images, text, infrastructure)
1. Write all required files that describe your quest and how all components work together
1. Store your quest files in Git (optional but highly recommended)
1. Pass your Quest to Wilco either with manual uploads or automatically from CI or the CLI
1. Let your players know that your quest is ready


![overview]

Wilco has very powerful features for defining the quest progression for the users. 
See the [Flow] documentation for more details.

[snack]: {% link assets/images/snack.png %}
[overview]: {% link assets/images/overview.png %}
[check]: {% link assets/images/check.png %}

[Building Your Quest]: {% link docs/building-your-quest/index.md %}
[Workspace]: {% link docs/building-your-quest/repository.md %}
[Flow]: {% link docs/building-your-quest/flow-nodes.md %}
