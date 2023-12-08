# Assignment

This is the assignment for KONE

--------------------

## Docker image
The docker is built and pushed to [Docker hub](https://hub.docker.com/repository/docker/mtkhanh/hello_world_project/general).

--------------------

## Commit message validation
We enforce a commit message format to ensure consistency and clarity. Commit messages should follow this format: type(scope): message
Where type is one of the following:

- feat: A new feature
- fix: A bug fix
- docs: Documentation changes
- style: Formatting, missing semi-colons, etc.; no code change
- refactor: Refactoring production code
- test: Adding tests, refactoring test; no production code change
- chore: Updating build tasks, etc.; no production code change

Example commit message: feat(api): Add new endpoint for user authentication

--------------------

## Creating Releases
We have a workflow set up to automate the creation of releases based on commits pushed to the master branch. The release version and release notes will be generated automatically using [Sematic Release](https://github.com/semantic-release/semantic-release) .

To create a release: Go to **Actions** -> **release** -> **Run workflow**.

Ensure your changes are merged into the main branch. The "release" workflow will trigger based on commits pushed to master and create a new release with versioning and release notes.

For more details on the release process, refer to the [.github/workflows/release.yaml](https://github.com/mtkhanh/helloworld/blob/main/.github/workflows/release.yaml).

--------------------

## What to improve:
- CI integration that run in between pull requests
- Documentation
- Branching stratergies 
