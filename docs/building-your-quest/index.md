---
title: Building Your Quest
has_children: true
nav_order: 5
---

# Quest Structure

Every uploaded quest must the following components: 
- A file called `quest.yml` that configures the metadata of the quest
- An `assets` folder with cover and logo images → [Assets]
- A `steps` folder with a yaml file for each step  → [Steps]

In addition, a `tests` folder can be added with test files to be used by the steps. → [Tests]
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

## quest.yml

This is a mandatory file that must be placed at the root of the zip archive's structure. This file defines the metadata of the quest:

```yaml
id: a unique quest identifier. Should not change. 3-50 characters, must begin with a letter. Accepted characters are A-Z, a-z, 0-9, and "_" | mandatory
title: Quest title. 2-80 characters. All characters are accepted. "Funnel Drop" in the sample below | mandatory
description: Quest description. All characters are accepted. "What's worse.." in the sample below | mandatory
slogan: Quest slogan. 2-1000 characters. "It's time for.." in the sample below | mandatory
level: Quest level. beginner/intermediate/advance | mandatory
duration: Estimated number of hours required to finish the quest | mandatory
resources: A list of resources that should be avaiable to the user when quest begins | optional 
- resource_1
- resource_2
- ...
- resource_n
steps: List of all quest step ids | mandatory
- step_id_1
- step_id_2
- ...
- step_id_n
skills: List of skills the user will work on when playing the quest | mandatory
- skill_1
- skill_2
- ...
- skill_n
questDependency: Quest that must be complete before playing this quest | optional
```

→ [Supported Skills]

→ [Quest Resources]


[Steps]: {% link docs/building-your-quest/creating-steps.md %}
[Assets]: {% link docs/building-your-quest/assets.md %}
[Tests]: {% link docs/building-your-quest/tests.md %}
[Supported Skills]: {% link docs/building-your-quest/supported-skills.md %}
[Quest Resources]: {% link docs/building-your-quest/quest-resources/index.md %}