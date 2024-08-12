## Running a clean install of ubuntu (for demonstration purposes, you don't need to run this)

`docker run -it -v ~/:/mnt/home ubuntu:latest`

## Installing git on Ubuntu for example

`apt update` -> installing in a regular computer, you will need to use `sudo apt ...`

`apt install git`

`apt git --version`

## Configuring git 

### This step is needed every time you are running git on a new computer or user

`git config --global user.name "Name"` -> any Name you want

`git config --global user.email "user@example.com"` -> this has to be the email linked with your github account

## Generating and copying a ssh key to git website 

### This step is needed every time you are running git on a new computer or user

First check if you already have a ssh key:

`ls ~/.ssh/id_rsa.pub` -> if this doesn't return any results, run `ssh-keygen -t rsa`, this will generate your ssh key. You can run the command and press enter twice to keep the default cofiguration

`cat ~/.ssh/id_rsa.pub`

copy the key to your github:

1) open www.github.com

2) click on your profile picure on the top-right corner

3) go to settings -> Ssh and GPG keys -> new SSH key

4) give a name for you key, for example 'home pc' and paste your ssh key on the 'key' field

Now you should be able to pull and push your files without the need of a password 

## Installing text editor for demonstration purposes

`apt install nano`

## Edit a random file you want to initiate the git

`mkdir test_folder`

`cd test_folder`

`git init`

`nano test.m`

## Create a brand new repository at github website and run this code in the folder of the files of the new repository
`git status`

`git add test.m` or `git add .`

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

## Updating just one file from the remote repository

```
git fetch
git checkout origin/branch_name -- file_name
```


## Other important tools:

- brancking and pull request in the master from the development branch, asking for revision

- Pull request, comments, request of modification, and approval; issue tracker

- Using the github on matlab

- Access control and blocking branches for edition

- Forking

- Wiki

## Misc useful commands

`.gitignore` -> file that contains the name of the files to the ignored by git, for example `*.o` would ignore all files with `.o` extension

`git mv` -> moves a files

`git rm` -> removes a files

`git pull` -> updates the current repository with the content of the remote repository

`git remote update` -> updates the current repository with the content of the remote repository without automatically merging

`git branch -r` -> list all the branchs in the repository

`git remote show origin` -> shows information about the branches

`git checkout <branch> <file>` --> copy a file from another branch to the current branch

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

## Reverting changes
`git log`

`git revert [commit-ID]`

## Updating fork from the original repository
`git fetch git@github.com:original_user/original_repository.git`

`git merge FETCH_HEAD`

`git push`

## When you made changes before git pull
`git stash`

`git pull`

`git stash apply`

## Configuring git with Matlab on Windowns

1 - install git for windows: https://git-scm.com/download/win, check the options "checkout as-is, commit as-is" and use Windows' default console window

2 - on powershell, create a key compatible with windows: `ssh-keygen -t rsa -b 4096 -m PEM` (source https://www.mathworks.com/matlabcentral/answers/494543-why-do-i-receive-an-auth-fail-error-when-interacting-with-a-git-remote-over-ssh-in-matlab-or-why-d)

3 - create an enviroment variable called HOME pointing to your home folder, as shown here: https://www.mathworks.com/help/matlab/matlab_prog/set-up-git-source-control.html

## When you want to reverse the master last commit and change the modifications in another brach

`git branch newbranchname`: creates a new branch and stores the current committ

`git reset --hard HEAD^`: reverse to the previous commit in the master branch

`git push origin master --force`: for pushing the last modifications

`git checkout newbranchname`: go to the newly created branch

`git push --set-upstream origin nROIs`: push the new branch

## creating a comment to ignore a line in the code

- create a file `<project root>/.gitattributes` and add filters to this new file, for example `*.m filter=gitignore`
- add the filter to the git config: `git config --global filter.gitignore.clean "sed '/gitignore/d'"`
- do nothing when pulling `git config --global filter.gitignore.smudge cat`
