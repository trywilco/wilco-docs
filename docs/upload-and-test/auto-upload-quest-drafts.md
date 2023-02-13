---
title: Auto-Upload Quest Drafts
parent: Uploading and Testing Your Quest
---


# Auto-Upload and Validate Quest Drafts

To simplify the process of validating and uploading draft versions, quest developers can configure their repo to validate the quests on prs and upload an updated version after pushing new code to the `main` branch.

To set up auto-upload:
1. Go to the [Quest Builder Utilities](https://app.wilco.gg/quest-builder-utils)
2. Generate a Quest Developer token by selecting the `Generate New Token` option. 
    - Make sure to save your token because it will only be shown once. 
3. Add the token to the quest repo secrets:
    1. Open quest repo settings.
    2. Tap `Secrets` on the left panel and select `Actions` in the drop-down.
    3. Tap the `New Repository Secret` button.
    4. Name the new secret `QUESTS_EDITOR_TOKEN` and copy the token to the `secret` text box. 
4. Add the new workflow files to the GitHub repo:
    - If you used the quest template, the files are already a part of the repo and needs to be configured. The files are located in `github/workflows/upload-draft.yml` and `github/workflows/validate-draft.yml`. Open the files and modify the value of the key `quest-editor-user-email` to the email address associalted with your Wilco account.
    - If the file are not part of your repo, [download them](https://app.wilco.gg/quest-builder-utils) and copy it to the `.github/workflows/` folder in your quest repo. No additional modifications to the files are required.
