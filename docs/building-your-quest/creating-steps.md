---
title: Creating Steps
parent: Building Your Quest
nav_order: 1
---

# Creating Steps

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

```

[Quest resources]

### Triggers and Payload

Each trigger in the system generates a payload that is passed to actions and conditions blocks along with the global payload. When defining a call to action/condition block in the flow nodes, the developer specifies how to map a param from the payload to a param passed to the block.

For full specification:

[Triggers and Payload]

### Logic flow (FlowNode)

Each step consists of two logical parts

1. `startFlow`: logic to be performed when step starts. Usually includes sending instructions to the user from one of the bots. 
2. `trigger`: logic to be performed when the user performs a specific action. 

In both cases, the flow is defined using flow nodes. Each flow node consists of `do`, `if` and `switch` blocks. Each of them is built using actions and conditions.

For documentation on flow nodes:

[Flow Nodes]

For documentation of all supported actions and conditions that can be used in the flows:

→ [Actions]
→ [Conditions]

### GitHub Actions

Each step that requires the user to open and merge a pull request (PR) can include the GitHub Actions configuration. These actions will run as part of a workflow triggered on every PR when the PR code changes. 

For full specification:

[GitHub Actions] {% link docs/building-your-quest/github-actions.md %}
[Quest resources] {% link docs/building-your-quest/quest-resources/index.md %}
[Triggers and Payload] {% link docs/building-your-quest/triggers-and-payload.md %}
[Flow Nodes] {% link docs/building-your-quest/flow-nodes.md %}
[Actions]: {% link docs/building-your-quest/actions.md %}
[Conditions]: {% link docs/building-your-quest/conditions.md %}
