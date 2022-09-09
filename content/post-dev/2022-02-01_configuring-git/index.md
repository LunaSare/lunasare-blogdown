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
## Creating an ssh key and adding it to our authenticator

https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent

To check if we have an ssh authentication already we run on the terminal:

```
ssh -v git@github.com
```

If we have the ssh authentication we will a message like this:

```
Hi User Name! You've successfully authenticated, but GitHub does not provide shell access.
```

If it is not succesful, follow to the next section.

### Generate the key

We will write the following command by replacing the email within quotations with the email we used to sign up on github. 
It is important to keep the quotations around the email:

```
ssh-keygen -t ed25519 -C "your_email@email.com"
```

The computer will ask:
```
Enter file in which to save the key (/Users/lunasare/.ssh/id_ed25519):
```
Leave it empty and type `return`.

The computer will then ask for a passphrase. Make sure to write one down, **do not leave this one empty**.

```
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
```

### Add the SSH key to the ssh-agent

The following command starts the authetication agent:

```
$ eval "$(ssh-agent -s)"
```

To automatically load keys into the ssh-agent and store passphrases in our keychain, we need a "~/.ssh/config" file

To check if we already have it we run:

```
ls ~/.ssh/config
```

If it does not exist, the command above will return an error, and we can proceed to create a file with:

```
touch ~/.ssh/config
```

Now we will open the "~/.ssh/config" file with a text editor and add the following text:

```
Host *

  AddKeysToAgent yes
  
  UseKeychain yes
  
  IdentityFile ~/.ssh/id_ed25519
```

Back in the terminal, we can add our SSH private key to the ssh-agent and store our passphrase in the keychain with the next line of code:

```
ssh-add -k ~/.ssh/id_ed25519
```


### As a last step, we will add the key to our account

We can do this with the github command line if we have the `gh` program installed:

```
gh ssh-key add ~/.ssh/id_ed25519.pub
```

Or we can manually copy it and add it to our GitHub profile.
Copy the key with:

```
pbcopy < ~/.ssh/id_ed25519.pub
```

Or copy/paste from:

```
cat ~/.ssh/id_ed25519.pub
```

We will go to our GitHub profile and add the SSH key we just copied.

Finally, we can check again that our ssh authentication is working with:

```
ssh -v git@github.com
```

## Setting up a token instead of a password for GitHub

https://stackoverflow.com/questions/68775869/support-for-password-authentication-was-removed-please-use-a-personal-access-to

### 1. Create Personal Access Token on GitHub

From your GitHub account, go to Settings => Developer Settings => Personal Access Token => Generate New Token (Give your password) => Fillup the form => click Generate token => Copy the generated Token, it will be something like ghp_sFhFsSHhTzMDreGRLjmks4Tzuzgthdvfsrta

You can save your token in a text file in your computer.

Use the token as your password next time you do `git push`. Follow the steps below to save this token in your git cache for the future.


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
