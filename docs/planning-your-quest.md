---
title: Planning Your Quest
description: Plan your own hands-on developer challenge ("quest") on Wilco using our Quest Builder
nav_order: 4
---

# Planning Your Quest


Before you begin building your quest, we strongly recommend completing the Tutorial and Setup quests in the Wilco platform to set up your Anythink environment and get to know the Anythink code repository. 

Once you've done that, you can start planning out the key aspects and outlining its content and structure. (See [quest template](https://github.com/trywilco/quest-template))

{: .note }
Investing time in the Planning stage will help you create better quests and save you a lot of time building and testing.  

Things to think about: 

**Level**

- Who is your intended audience? What is experience level is your quest suitable for (beginner/intermediate/advanced)?
- What is the prerequisite knowledge required to successfully complete the quest?

**Skills** 
- What skills is your quest related to? (See [supported skills])

**Learning Objectives**
- What can developers expect that they will be able to DO after they complete this quest?

**Quest Task**

- What is the main goal developers need to achieve in this quest?
- Is this a common task developers face?
- Is this task something developers commonly struggle with? What types of mistakes are common?
- Why is it important for developers to know how to do this? What could be a potential outcome of doing it wrong in the real world?

**Quest scenario** 

- In what context might a developer need to complete this task in the real world?
- Is the scenario you’ve chosen realistic? Common? Interesting?

**Steps** 

- What are the steps required to complete the task?
- What will the user DO in each step? Do these steps align with the learning objectives you defined? 
- Does the order of the steps make sense?
- How will you verify that the step has been completed successfully?
- How will users progress to the next step? 
- Are there any tests you need to write to check users’ work?
- What hints can you provide to help users if they get stuck? (Each step should have at least one hint)
- What would a textbook solution look like?

**Quest Duration** 

- How long do you think it will take developers to complete the quest?
- How long would it take you to perform this task, if you were doing it for the first time?


<details markdown="block">
  <summary>
    <b>
    Example 1
    </b>
  </summary>
  {: .text-gamma .text-purple-100	}

**What we want users to learn:**
How do we do state management in React

**Prerequisites:**
Users should have the Anythink system up and running (a full stack system with backend, frontend and DB)

**Task:**
User gets a new feature request to build, this feature needs some state to pass between a couple of components in the page

- **Step1:**
  - User gets a spec of the new UI component they need to build, first they just need to build the UI with simple internal state
  - How do users pass to the next step: user opens a PR, in the PR we run some tests that the component exists and function properly (with unit test)

- **Step 2:**
  - We saw that there’s a bug and when users change a state in this component, they also need to change another component’s state in the page. First install the library that we use so we’ll later be able to use it.
  - How do users pass to the next step: user opens a PR with the new lib in the package.json

- **Step 3:**	

  - Now they need to fix the page state accordingly and make the two components communicate using the library we just installed.
  - How do users pass to the next step: User opens a new PR and we run a UI test to see that when clicking in 1 place it affects the other.

</details>

<details markdown="block">
  <summary>
    <b>
    Example 2
    </b>
  </summary>
  {: .text-gamma .text-purple-100	}

**What we want users to learn:**
A better understanding of data modeling and dependencies

**Prerequisites:**
Users should have the Anythink system up and running (a full stack system wih backend, frontend and DB)

**Task:**
User needs to add a new feature where each item should have a score based on the reviews

- **Step1:**
  - Each item’s review should have a score
  - How do users pass to the next step: user opens a PR, in the PR we run some tests that the model has the new field


- **Step 2:**
    - Calculate the item’s score based on it’s reviews’ score, this have many edge cases (why if a review was deleted or changed) and a question of performance (when do we calculate the overall score)
    - How do users pass to the next step: user opens a PR, in the PR we run some tests that the model has the new field and it calculated properly


- **Step 3:**	
  - Open the score to the API and show it in the UI
  - How do users pass to the next step: User opens a new PR and we run a UI test


</details>
[supported skills]: {% link docs/building-your-quest/supported-skills.md %}
