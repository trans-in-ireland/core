### Workstation setup

If you want to have a separate profile for github to work on this project read below.

```shell
$ ssh-keygen -f ~/.ssh/other_github_rsa
...

$ cat ~/.gitconfig
...
[url "git@other-github:trans-in-ireland"]
    pushInsteadOf = https://github.com/trans-in-ireland

$ cat ~/.ssh/config
...
Host other-github
    User git
    HostName github.com
    IdentityFile ~/.ssh/other_github_rsa
    IdentitiesOnly yes
```
