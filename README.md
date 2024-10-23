# README

This app is built in response to the set task - Use Ruby on Rails to build a project conversation history. A user should be able to:

- leave a comment
- change the status of the project

The project conversation history should list comments and changes in status. 

## Stack
The app is built with
 - Ruby 3.3.0
 - Rails 7.1.4
 - TailwindCSS
 - PostgreSQL
 - Turbo
 - Stimulus
 - Rspec for testing

## Setup

To run the app locally, please clone the repo and then
 - Create the databases `bin/rails db:create`
 - Seed the data `bin/rails db:seed`
 - start the app with `bin/dev` to allow for asset compilation

## To use

On loading `localhost:3000` you should be taken to the index page of Projects, in order to test the changing of a project status and adding of a new comment, please click through to any project of your choice.

On the project show page you will be able to change the project status courtesy of the dropdown menu and add a new comment by clicking the `Add New Comment` button which will reveal a form that you can complete. All behaviours can be experienced on the show page.

Tests are available in `spec` please run the them with `rspec <filepath>`

## Role playing for understanding the brief

Q - Can the status of a project be anything?
A - No. A Project can only have a status of `created`, `planning`, `in_progress`, `in_review`, or `completed`.

Q - Does a comment have a maximum length?
A - No, we want users to be able to leave detailed comments.

Q - Should comments be seen in any particular order?
A - Yes, we should show comments the order of recency.

Q - Are comments permitted to be edited or deleted?
A - No, we want the project history to be immutable.

## What this app does not do and where it can be improved
This application is an MVP designed for the brief provided. There is great scope to make improvements.
 - Authentication - The application should make use of authentication in order to ensure that only logged-in users can see and edit information.
 - User association with Comments - By making use of user accounts, we can associate users with a comment made, further improving the utility of the conversation history.
 - Introducing an Organisation table to own projects - at the moment any user would be able to see any project, in order to scale this application, a new table of Organisation should be introduced to own projects.
 - User permissions through Organisations - With Organisations included, users can be assigned role permissions based on their organisation, ensuring that only the correct projects are visible to them.
 - Sub-projects - The current design makes the assumption that a Project is single entity and is commented on accordingly. This lacks flexibility and the idea of sub-projects should be introduced.
 - Notifications - The application should make use of notifications such as email to inform contributors to new comments or status changes.
 - Extending Comment body to include non-text options - Images and videos should be permitted as acceptable body content for a comment.
 - Design - I have made use of TailwindCSS to provide simple out of the box styling options, but there is scope to improve the UI in order to create a more user friendly experience.
