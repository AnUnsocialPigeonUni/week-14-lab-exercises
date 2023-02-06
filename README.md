# Week 14

CI and CD

## Project structure

- `insecure/` a nodejs project with insecure dependencies
- `mashup/` some messed up JS
- `unittesting/` some unit tested js

## Links

see [Github Actions, Getting started](https://docs.github.com/en/actions/quickstart)
## Your mission

1. [x] Get CI to test for insecure modules
    1. [x] Fix issues
    1. [x] recommit
1. [x] Get CI to detect messed up JS
    1. [x] Fix issues
    1. [x] recommit
    1. [x] Mash it up again
    1. [x] recommit
1. [x] Get CI to run unit testing
    1. [x] Fix issues
    1. [x] recommit
    1. [x] Add a new test case for Bulgarian
    1. [x] recommit
1. Create a new project called `combined/` which outputs a
hello greeting depending on the language you pass in the url
    1. [ ] It must lint
    1. [ ] It must check for known security vulns in dependencies
    1. [ ] It must run unit tests for new languages
1. **Stretch goal** Deploy your application to AWS
    1. [ ] Setup CI steps
    1. [ ] Setup CD deployment using Cloudformation
    1. [ ] Make a change and have it re-deploy
