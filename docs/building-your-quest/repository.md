---
title: Start Repository
parent: Building Your Quest
---

# Start Repository

Each Wilco quest is associated with a start repository. When the user starts a new quest, their repository will be initialized using the start repository defined in the quest. The repository must be public.

If a start repository was not defined in the `quest.yml` file, The [Anythink Market] repository will be used.

Reasons to use a start repository could be, for example:
1. Adding a bug to the code that the user will be asked to fix.
2. Adding a new feature that the user will be asked to extend.
3. Changing UI design to add your own branding.
4. Using a codebase that is not related to Anythink.

## Using frameworks specific files
Wilco users select their frontend and backend frameworks/languages. It is common to create a start repository that allows playing a quest using several frameworks. This is also the case in the Anythink Market repository.

Framework-specific files are placed in `.framework` directory using the following structure:
```
.framework
├── <framework_name_a>
│   ├── <framework_specific_direcotry>
│   ├── <framework_specific_direcotry>
│   ├── <framework_specific_file>
│   ├── ...
│   ├── <framework_specific_file>
│
├── <framework_name_b>
│   ├── <framework_specific_direcotry>
│   ├── <framework_specific_direcotry>
│   ├── <framework_specific_file>
│   ├── ...
│   ├── <framework_specific_file>
│
├── <framework_name>
│   ├── <framework_specific_direcotry>
│   ├── <framework_specific_direcotry>
│   ├── <framework_specific_file>
│   ├── ...
│   ├── <framework_specific_file>
``` 

When the user starts a quest, the `.framework` directory will be removed from the repository, and the framework-specific files will be copied to the root of the repository.

The Anythink Market repository is a good example of a start repository that uses framework-specific files. The repository supports Node, Rails, and Python as backend frameworks and React as a frontend framework. Each backend framework requires a specific `docker-compose.yml` file and `charts` directory for K8s deployment. The following is the structure of this repository:

```
Anythink-Market-Public
├── readme.dm
├── .github
├── .framework
│   ├── node
│   │   ├── backend
│   │   ├── charts
│   │   ├── docker-compose.yml
│   ├── python
│   │   ├── backend
│   │   ├── charts
│   │   ├── docker-compose.yml
│   ├── rails
│   │   ├── backend
│   │   ├── charts
│   │   ├── docker-compose.yml
│   ├── react
│   │   ├── frontend
``` 

The user's repository will result in the following structure after starting the quest:
```
User's Repository
├── readme.dm
├── .github
├── docker-compose.yml
├── backend
│   ├── backend files
├── frontend
│   ├── frontend files
├── charts
│   ├── charts files
```

[Anythink Market]: https://github.com/trywilco/Anythink-Market-Public