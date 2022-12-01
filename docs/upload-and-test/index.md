---
title: Uploading and Testing Your Quest
has_children: true
has_toc: false
nav_order: 6
---

# Uploading and Testing Your Quest

## Uploading Quests 

1. Create a zip file with the quest materials. You can use one of the following methods:
    
    A. Create a new release in your GitHub repository and download the zip asset generated for the release (see [managing releases in a repository]).
    
    B. Manually zip the files located on your local machine.
    
    C. [Auto-Upload Quest Drafts] using Github Workflow.
        
    {: .important }
    Make sure you have Quests Builder permissions in Wilco.
        
2. If you don't use auto-upload, please upload the zip file manually. Open the [Quest Builder] page, tap on the `upload new quest` button and select the zip file. If you're uploading a new version for an existing quest, find the quest in the list and click the `upload version` button.
3. Once the quest has finished uploading, click the `test quest in Snack` button and test the full quest flow.

## Testing Quests 
Quest Builder enables you to run your quest in a Snack Testing environment that simulates the quest exactly as users would see it in Production. 

Before testing your quest, you will need to complete the Tutorial and Setup quests to set up your Anythink environment (If you haven't done so already). Afterwards, you should familiarize yourself with the Anythink repo. Once you accept the invitation from Navi to join the Anythink repo, you'll be able to access it directly from the left-hand side panel in Snack. 

It is important to go through each step of your quest thoroughly to make sure that everything works as expected. 

Once you have verified that your quest works well, you can use **Manual mode** to speed up testing interations. 

To use Manual mode, simply type `manual` in the chat, and you'll see a list of commands you can use.  

### Supported Commands: 
- `listSteps` - list ids of steps in the quest, including marking the current step.
- `nextStep` - jump to next step or finish the quest if this is the last step.
- `prevStep` -  jump to previous step or restart quest if this is the first step.
- `printStepInfo` - print YAML representation of the current step.
- `printQuestInfo` - print YAML representation of the quest
- `resetStep` - restart current step
- `resetQuest` - restart quest


[managing releases in a repository]: https://docs.github.com/en/repositories/releasing-projects-on-github/managing-releases-in-a-repository
[Auto-Upload Quest Drafts]: {% link docs/upload-and-test/auto-upload-quest-drafts.md %}
[Quest Builder]: https://app.wilco.gg/quest-builder


