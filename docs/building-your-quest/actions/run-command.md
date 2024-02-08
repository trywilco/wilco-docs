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
- **timeout**: The maximal time in seconds to wait for the command to finish. The default is 30 seconds.

## Outputs

Stdout and stderr of the command are added to the global payload outputs.
In case of error, the error message will be added to the global payload outputs.

## Usage Example

```yaml
 do:
   - actionId: run_command
     name: command
     params:
       command: pwd

   - actionId: run_command
     name: failed_command
     params:
       command: non_existing_command


   - actionId: bot_message
     params:
       person: keen
       messages:
         - text: "command1: ${outputs.command.data}"

   - actionId: bot_message
     params:
       person: keen
       messages:
         - text: "command2:${JSON.stringify(outputs.failed_command.error)}"
```

In this example, the command `pwd` is run on the remote machine, and the output is added to the global payload outputs. 
Then, a non-existing command is run, and the error message is also added to the global payload outputs.

## Relevant Triggers

All triggers

