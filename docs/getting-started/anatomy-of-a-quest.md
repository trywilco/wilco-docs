---
title: Anatomy of a Quest
parent: getting-started
---

# Quest Configuration Files

The uploaded zip must follow the following file structure:

```
quest.zip
├── quest.yml
│
├── assets
│   ├── cover.jpeg
│   └── logo.svg
├── steps
│   ├── <step_id_1>.yml
│   ├── <step_id_2>.yml
│   ├── ...
│   └── <step_id_n>.yml
└── tests
    ├── <test_file_name_1>
    ├── <test_file_name_2>
    ├── ...
    └── <test_file_name_n>
```

The full documentation on the quest files configuration files can be found here:

[Quest configuration files ](Quests%20Creation/Quest%20Configuration%20Files.md)

[Quest resources](Quests%20Creation/Quest%20Resources.md)

### Triggers and Payload

Each trigger in the system generates a payload that is passed to actions and conditions blocks along with the global payload. When defining a call to action/condition block in the flow nodes, the developer specifies how to map a param from the payload to a param passed to the block.

For full specification:

[Triggers and Payload](Quests%20Creation/Triggers%20and%20Payload.md)

### Logic flow (FlowNode)

Each step consists of two logical parts

1. `startFlow`: logic to be performed when step starts. Usually includes sending instructions to the user from one of the bots. 
2. `trigger`: logic to be performed when the user performs a specific action. 

In both cases, the flow is defined using flow nodes. Each flow node consists of `do`, `if` and `switch` blocks. Each of them is built using actions and conditions.

For documentation on flow nodes:

[Flow Nodes](Quests%20Creation/Flow%20Nodes.md)

For documentation of all supported actions and conditions that can be used in the flows:

[Actions and Conditions](Quests%20Creation/Actions%20and%20Conditions%20APIs.md)

### GitHub Actions

Each step that requires the user to open and merge a pull request (PR) can include the GitHub Actions configuration. These actions will run as part of a workflow triggered on every PR when the PR code changes. 

For full specification:

[GitHub Actions](Quests%20Creation/GitHub%20Actions.md)
