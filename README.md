## Running a clean fit install of ubuntu

`docker run -it -v ~/:/mnt/home ubuntu:latest`

## Installing git    

`apt update` -> installing in a regular computer, you will need to use `sudo apt ...`

`apt install git`

`apt git --version`

## configuring git

`git config --global user.name "Name"`

`git config --global user.email "user@example.com"`

## Generating and copying a ssh key to git website

`ls ~/.ssh/id_rsa.pub` -> if this doesn't return any results, run `ssh-keygen -t rsa`, this will generate your ssh key

`cat ~/.ssh/id_rsa.pub`

## Installing text editor for demonstration purposes

`apt install nano`

## Edit a random file you want to iniciate the git

`mkdir test_folder`

`cd test_folder`

`git init`

`nano test.m`

## Create a brand new repository at github website and run this code in the folder of the files of the new repository
`git status`

`git add test.m`

or 

`git add .`

`git commit -m "first commit"`

`git branch -M master`

`git remote add origin git@github.com:tsantini/test.git`

`git remote add upstream git@github.com:tsantini/test.git`

`git push -u origin master`

## Cloning from a existing repository

`git clone git@github.com:tsantini/test.git`

## Editing the existing repository

`nano test.m`

`git diff`

`git add .`

`git commit -m 'adding a new comment to the file'`

`git push`

## Creating a development branch

`nano test.m`

`git status` -> checking the current branch

`git checkout -b development`

`git add .`

`git commit -m 'editing in the development branch'`

`git push`


## Demostration: brancking and pull request in the master from the development branch, asking for revision

## Review of pull request, comments, request of modification, and approval; issue tracker

## Demostration: using the github on matlab

## Demostration: access control and blocking branches for edition

## Forking

## Demostrate: wiki

## Misc useful tools

`.gitignore` -> file that contains the name of the files to the ignored by git, for example `*.o` would ignore all files with `.o` extension

`git mv` -> moves a files

`git rm` -> removes a files

`git pull` -> updates the current repository with the content of the remote repository

`git remote update` -> updates the current repository with the content of the remote repository without automatically merging

`git branch -r` -> list all the branchs in the repository

`git remote show origin` -> shows information about the branches

## Conflicts

when there is a conflict, for example, you modified a piece of code that was also modified remotely, it will show up like this when you do `git pull`:

```
If you have questions, please
<<<<<<< HEAD
open an issue
=======
ask your question in IRC.
>>>>>>> branch-a
```

## reverting changes
`git log`

`git revert [commit-ID]`





