== Meetings Log

=== 2024-02-14
*Participants*
- Jan Lauber
- Erik Graf

*Topics*
- Schedule and next steps
- Deliverables: 
  - Task distribution
  - Solution
  - Documentation
  - Presentation
- Timeboxing for deliverables: Calculated back to 4-5 weeks
- Incorporating feedback into documentation at the beginning of the meeting
- Project 2 feedback: Positive on presentation and business perspective
- Discussion on Reflex Apps enhancing AI:
  - Autoconfiguration
  - Autocompletions
- Suggestions: Analyze latencies, requests, and configuration data for user-based recommendations
- Future meetings: Fridays in Biel, Wednesdays in Bern
- Examining use cases, Reflex deployment, chat solution integration

*Action Items*
- Define paper structure
- Define deliverables to be completed within 4-5 weeks
- Task planning in Github Project

#pagebreak()

=== 2024-03-01
*Participants*
- Jan Lauber
- Erik Graf

*Topics*
- Expert posted on Moodle
  - Schedule meeting with expert
- Integration of business perspectives in thesis
- Discuss upcoming business trip

*Action Items*
- Schedule meeting with expert via email

=== 2024-03-05
*Participants*
- Jan Lauber
- Emanuel Imhof (Founder of Unbrkn GmbH @UnbrknGmbH)

*Topics*
- Presentation of the project and MVP
- Emanuel Imhof's feedback on the project
  - Vercel Alternative for Node Projects
  - Remix project for Zermatt Tourism #sym.arrow.r #link("https://ggb-map.unbrkn.dev")
- Shared Kubernetes cluster hosting at Natron Tech AG @NatronTechAG

*Action Items*
- User documentation for the project
- Setup of the project on the shared Kubernetes cluster


=== 2024-04-17
*Participants*
- Jan Lauber
- Erik Graf

*Topics*
- Onboarding Coralie completed
- Creation of landing page and initial user documentation
- Discussion on business case and target audience
- Preparation for kanban setup and documentation website
- Implementation of CI/CD GitHub with testing and pre-commit hooks

*Action Items*
- Address inquiries regarding presentation and video requirements at defense
- Finalize features and documentation

=== 2024-05-01
*Participants*
- Jan Lauber
- Reto Tinkler

*Topics*
- Review of current status
- Presenting the project to the expert
- Discussion on the presentation and defense

*Action Items*
- Show business case and target audience in the presentation
- Documentation should contain: Requirements, target audience, customers, project management, marketing

=== 2024-05-03
*Participants*
- Jan Lauber
- Emanuel Imhof (Founder of Unbrkn GmbH @UnbrknGmbH)

*Topics*
- Onboaring Emanuel Imhof on the One-Click Deployment system
  - Teleport user
  - One Click user
  - One Click introduction
- Discussion on the project and its future
- Feedback on the project and contract for managed OneClick

*Action Items*
- Fix some bugs in the project
  - Typo in the delete page of the deployment
  - Auto Image Update is not working when configured for multiple deployments

=== 2024-05-22
*Participants*
- Jan Lauber
- Erik Graf

*Topics*
- Improvements to One-Click.dev:
  - Highlighting its power: all the benefits of Kubernetes without the hassle, cloud-agnostic, non-proprietary
  - University's interest in a Kubernetes cluster that is easy to configure
    - Automatic lifetime management of 12 months for VMs
  - One-Click as an enterprise edition:
    - Automatic cleanup and policy management
    - Pricing between 5-10k CHF/year
  - Identifying champions for the platform

- Preparation and practice for the presentation:
  - Emphasizing the business case
  - Preparing for a deeper business-technical defense presentation

- Administrative tasks:
  - Sending the PDF document
  - Book entry
  - Creating a marketing video featuring the BFH logo

*Action Items*
- Highlight improvements to One-Click.dev in the presentation
- Emphasize ease of use and enterprise features in marketing materials
- Prepare and practice the presentation with a focus on the business case and technical depth
- Send the required PDF document
- Make a book entry
- Create and distribute a marketing video with the BFH logo

=== 9.5.8 2024-06-05

*Participants*
- Jan Lauber
- Erik Graf

*Story of the presentation*
- Begin the presentation from a developer's perspective.
  - The developer discovers Node-RED and wants to deploy it.
  - Show screenshots of overwhelming deployment setups (e.g., Azure Kubernetes Service).
    - Highlight the complexity of Kubernetes.
    - Transition to where people host their Kubernetes clusters.
  - Start the second case with a custom development like Streamlit.
- *Proposal Feedback:* Erik finds the proposal excellent.
- *Iteration Process:* Discuss the numerous iterations the system has undergone.
- *Power User Representation:* How to depict power users.
- *Conventions:* What conventions the system adheres to.
- *Limitations and Transition:*
  - When to switch to native Kubernetes.
- *Commercial Aspect:* Incorporating the commercial aspect into the story.

*Documentation*
- *GitHub Repository:* [Bachelor Thesis Repository](https://github.com/janlauber/bachelor-thesis)
  - Should a lot of code be included? Erik suggests linking it.

*Feedback*
- *Commercial Deployment:* The system has been successfully deployed in a commercial setup.
- *Knowledge for Kubernetes Deployment:*
  - What does one need to know to deploy in Kubernetes?
  - Main steps in bullet points.
- *Gaps in Existing Solutions:*
  - Provide concrete examples; it's quite complex.
- *UX Design and Application Logic Description:*
  - Move "4. Design goal" to "1. User Experience."
  - Obscure other background processes.
  - Focus on why and how we are doing this; emphasize "convention over configuration" (centralizing configuration).
  - Project creation and monitoring.
  - Main value for the user.
  - Opinionated use cases.
- *Screenshots:*
  - Increase the prominence of user interaction.
  - Better structure the presentation.

*Page Count:* Approximately 60 pages.