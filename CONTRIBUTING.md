# Contributing to the Mergington High Extra-Curricular Activities Website

Thank you for your interest in helping improve the aquacul!
Whether you want to add your club's activities, fix a bug, or suggest
new features, this guide will help you get started. 🎉



## Development Setup

1. Clone the repository to your computer.
2. Check for installed dependencies by executing the code in `dependencies.R`
3. Check whether you have the correct package version installed: `renv::status()`



## Making Changes

1. Create a new branch for your changes.
   - Use descriptive names like `art-gallery-feature` or `fix-chess-signup`
2. Make your changes and test them locally with sample student data.
   - Use the MongoDB extension to preview the included sample date.
3. Push your branch and create a pull request.
4. Wait for review and address any feedback.



## Code Style

- Follow the 'Advanced R' Style Guide by Hadley Wickham: http://adv-r.had.co.nz/Style.html
- Use clear, descriptive variable names (student_name, start_time, etc.)
- Use the reformatting functions implemented in RStudio to format the code.
- Where necessary, add comments to describe blocks of logic.



## Need help or have ideas?

- Check the open issues first.
  - If your problem is there, add a comment or up-vote.
  - If not there, create a new issue. Be as descriptive as possible.
  - Add labels to your opened issue, e.g. `enhancement` for new functions.