# Contributing to the aquacultuR package

Thank you for your interest in helping improve the aquacultuR package! 
This package is an Open Source project and thus open for contributions from 
everyone who would like to help us moving forward. Whether you want to fix a 
bug, or suggest new features, this short guide will help you get started. 🎉


## Development Setup

1. Clone the [Git repository](https://github.com/TellAnAx/aquacultuR) to your computer.
2. **Make sure you are using the latest version of all packages, R and RStudio!** 
3. Start coding!


## Making Changes

1. **Create a new branch for any changes you want to make!**
    - Use descriptive branch names like `growth-metric-feature` or `fix-documentation-typo`.
2. Make your changes and test them locally with the sample data that comes with this package.
3. Push your branch and create a [Pull Request](https://github.com/TellAnAx/aquacultuR/pulls) on GitHub.
4. Wait for review and address any feedback.
5. Increment the version number with `usethis::use_version("patch")`.
6. Add a note to the `NEWS.md` file.


## Code Style

- We use `roxygen2` to write functions and documentation and `testthat` to implement tests.
- Our functions start with a series of input checks, followed by the function logic. 
- Check the existing variable names. If a variable does not yet exist, use a clear, descriptive name (start_time, biomass etc.).
- Use the reformatting functions implemented in RStudio to format the code.
- Where necessary, add comments to describe blocks of logic.


## Need help or have ideas?

- Check the open [Issues](https://github.com/TellAnAx/aquacultuR/issues) on Github.
  - If your problem is there, add a comment or up-vote.
  - If not there, create a new issue. Be as descriptive as possible.
  - Add labels to your opened issue, e.g. `enhancement` for new features.
- Engage in a [Discussion](https://github.com/TellAnAx/aquacultuR/discussions) on GitHub.
  