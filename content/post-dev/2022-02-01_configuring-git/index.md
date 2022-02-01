---
title: "Configuring git"
author: Luna L. Sanchez-Reyes
date: "2022-02-01"

tags:
- Reproducibility
- Open Science
- version control
- github


summary:
---
## Create an ssh key and adding it to your authenticator

https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent

Check if you have an ssh already with:

```
ssh -vT git@github.com
```

### Generate the key

ssh-keygen -t ed25519 -C "sanchez.reyes.luna@gmail.com"

### Add the SSH key to the ssh-agent

Start the agent:
```
$ eval "$(ssh-agent -s)"
```

To automatically load keys into the ssh-agent and store passphrases in your keychain, we need the "~/.ssh/config" file

Check if you already have it:

```
ls ~/.ssh/config
```

If it does not exist, create one with:

```
touch ~/.ssh/config
```

And add the following text to the "~/.ssh/config" file:


Host *
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_ed25519


Add your SSH private key to the ssh-agent and store your passphrase in the keychain

```
ssh-add -k ~/.ssh/id_ed25519
```


### Finally, add the key to your account:

With the github CLI:

```
gh ssh-key add ~/.ssh/id_ed25519.pub
```

Or manually copying it and adding it to your GitHub profile:

pbcopy < ~/.ssh/id_ed25519.pub

Or copy/paste:

cat ~/.ssh/id_ed25519.pub

Check again that your ssh authentication is working with:

```
ssh -vT git@github.com
```

## Setting up a token instead of a password for GitHub

https://stackoverflow.com/questions/68775869/support-for-password-authentication-was-removed-please-use-a-personal-access-to

### 1. Create Personal Access Token on GitHub

From your GitHub account, go to Settings => Developer Settings => Personal Access Token => Generate New Token (Give your password) => Fillup the form => click Generate token => Copy the generated Token, it will be something like ghp_sFhFsSHhTzMDreGRLjmks4Tzuzgthdvfsrta


### 2. Configure the local GIT client
For a Linux-based OS ⤴
For Linux, you need to configure the local GIT client with a username and email address,

```{bash}
$ git config --global user.name "your_github_username"
$ git config --global user.email "your_github_email"
$ git config -l

```

### 3. Cache the given record in your computer to remember the token:

```
$ git config --global credential.helper cache
```

If needed, anytime you can delete the cache record by:

```
$ git config --global --unset credential.helper
$ git config --system --unset credential.helper
```
