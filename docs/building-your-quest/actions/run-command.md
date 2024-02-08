---
title: run_command
parent: Actions
grand_parent: Building Your Quest
---

# run_command

Category: Remote Machine
Description: Run a command on the user's remote codespace
Type: Action

### Description

**Type**: action

Run a command on the user's codespace. The action uses an agent running on the remote machine.

## Params

- **command:** The command to run on the remote machine. i.e. `ls -l`
- **timeout**: The maximal time in seconds to wait for the command to finish. The default is 60 seconds.

## Outputs

Stdout and stderr of the command are added to the global payload outputs.

## Usage Example

```yaml
do:
- actionId: run_command
  params:
    command: ls -l
```

In this example, the command `ls -l` is run on the remote machine, and the output is added to the global payload outputs.

## Relevant Triggers

All triggers

