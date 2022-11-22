---
title: Building Your Quest
nav_order: 2
---

## **Building Your Quest**

1. Create a new repository by going to the [quest template](https://github.com/trywilco/quest-template){:target="_blank"} and clicking the "use this template" button. This template is a clone of the ["Funnel Drop" quest](https://app.wilco.gg/catalog/quest/mobile-responsiveness){:target="_blank"} and is fully playable as-is.
2. Update the files to support your new quest, according to the [quest development guidelines](https://github.com/trywilco/wilcosdk/tree/main/Quests%20Creation/Quest%20Development%20Guidelines):
    1. Make sure to modify the `id` in `quest.yml` and specify a unique quest identifier.
    2. Use the documentation to modify the quest metadata and the logic of the steps.
3. Create a zip file with the quest materials. You can use one of the following methods:
    1. Create a new release in your GitHub repository and download the zip asset generated for the release: [https://docs.github.com/en/repositories/releasing-projects-on-github/managing-releases-in-a-repository](https://docs.github.com/en/repositories/releasing-projects-on-github/managing-releases-in-a-repository)
    2. Manually zip the files located on your local machine.
    3. Auto-upload using Github Workflow : [Auto-Upload Quest Drafts](Quests%20Creation/Auto-Upload%20Quest%20Drafts.md)
        
        **NOTE**: *Make sure you have Quests Builder permissions in Wilco.*
        
4. If you don't use auto-upload, please upload the zip file manually. Open the [Quest Builder](https://app.wilco.gg/quest-builder){:target="_blank"} page, tap on the `upload new quest` button and select the zip file. If you're uploading a new version for an existing quest, find the quest in the list and click the `upload version` button.
5. Once the quest has finished uploading, click the `test quest in Snack` button and test the full quest flow.
6. When the quest is ready, click the `submit for review` button. ([See: Review Process and Submission Guidelines](https://github.com/trywilco/wilcosdk/blob/Documentation_Quest_Guidelines/Quests%20Creation/Quest%20Development%20Guidelines/Review%20Process%20and%20Submission%20Guidelines))
7. Once a quest is approved, it will automatically be published to the Wilco Quest Catalog and become available to all Wilco users.


💡 To publish a quest only to users from your company, you'll need **Wilco for Teams**. Learn more [here](https://www.trywilco.com/teams/join).

