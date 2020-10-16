## Running a clean fit install of ubuntu

`docker run -it -v ~/:/mnt/home ubuntu:latest`

## Installing git    

`apt update`

`apt install git`

## Generating and copying a ssh key to git website

`ssh-keygen -t rsa` -> only run this if you don't have a key already setup, you can check that with the command below

`cat ~/.ssh/id_rsa.pub `

## Installing text editor for demonstration purposes

`apt install nano`

## Edit a random file you want to iniciate the git

`mkdir test_folder`

`nano test.m`

## Create a brand new repository at github website and run this code in the folder of the files of the new repository
`git init`

`git add test.m`

`git commit -m "first commit"`

`git branch -M main`

`git remote add origin git@github.com:tsantini/test.git`

`git push -u origin main`

## Cloning from a existing repository

`git clone git@github.com:tsantini/test.git`

## Editing the existing repository

`nano test.m`

`git add .`

`git commit -m 'ading a new comment to the file'`

`git push`

## Creating a development branch

`nano test.m`

`git status` -> checking the current branch

`git checkout -b development`

`git add .`

`git commit -m 'editing in the development branch'`

`git push`

## Demostration: pull request in the master from the development branch

## Demostration: using the github on matlab

## Demostration: access control and blocking branches for edition

## Demostrate: wiki
