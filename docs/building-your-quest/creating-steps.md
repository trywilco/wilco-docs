---
title: Creating Steps
parent: Building Your Quest
nav_order: 1
---

# Steps

This is a mandatory folder containing a file for each step defined in `quest.yml` file. There are no rules regarding the file names.

```yaml
id: Step id as specified in quest.yml file | mandatory
learningObjectives: Bulletpoints stating what users will learn to do in the quest | mandatory
- learning_objective_1
- learning_objective_2
- ...
hints: List of hints to give the user when they are stuck | optional
- hint_1
- hint_2
- ...
- hint_n
startFlow: Flow node logic to execute when the step begins | optional
	...
trigger: Trigger type and flow node logic. Each step has one trigger | mandatory
  type: Type of trigger (user action) the step waits for
  flowNode: Flow node logic to execute when user perform the action | mandatory
    ...
githubAction: Github Actions configuration to run in opened PRs | optional
```

→ [Triggers and Payload](Triggers%20and%20Payload.md)

→ [Flow Nodes](Flow%20Nodes.md)

→ [Actions]

→ [Conditions]
    

    
[Actions]: {% link docs/building-your-quest/actions.md %}
[Conditions]: {% link docs/building-your-quest/conditions.md %}