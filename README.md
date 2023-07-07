# Extra notes

In setting up `gh.nvim` I found that the PR's would fetch but the final check wouldn't then load the interface to browse the pull request. Reading the source code it was because the protocol was not set to `ssh`

Running this solved it for me:

```sh
gh config set git_protocol ssh
```
