---
title: Upload using a command line tool
parent: Uploading and Testing Your Quest
---


# Upload using a command line tool

A command line tool can be used to automate the process of zipping and uploading a quest

Download the executable according to the operating system you use:

[Windows] [MacOS] [Linux]

TODO: REPLACE description

To set up auto-upload:
1. Go to the [Quest Builder Utilities](https://app.wilco.gg/quest-builder-utils)
2. Generate a Quest Developer token by selecting the `Generate New Token` option. 
    - Make sure to save your token because it will only be shown once. 
3. Add the token to the quest repo secrets:
    1. Open quest repo settings.
    2. Tap `Secrets` on the left panel and select `Actions` in the drop-down.
    3. Tap the `New Repository Secret` button.
    4. Name the new secret `QUESTS_EDITOR_TOKEN` and copy the token to the `secret` text box. 
4. Add a new workflow file to the GitHub repo:
    - If you used the quest template, the file is already a part of the repo and needs to be configured. The file is located in `github/workflows/upload-draft.yml`. Open the file and modify the value of the key `quest-editor-user-email` to the email address associalted with your Wilco account.
    - If the file is not part of your repo, [download it](https://app.wilco.gg/quest-builder-utils) and copy it to the `.github/workflows/` folder in your quest repo. No additional modifications to the file are required.

[Windows]: {% link docs/upload-and-test/upload-quest-cli/upload_quest-win.exe %}
[MacOS]: {% link docs/upload-and-test/upload-quest-cli/upload_quest-macos %}
[Linux]: {% link docs/upload-and-test/upload-quest-cli/upload_quest-linux %}
