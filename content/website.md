+++
title = 'Sigmanauts.com'
date = '2023-04-27T00:00:00-00:00'
draft = 'false'
+++

As an open community, anyone can submit a pull request to make additions or corrections to the Sigmanaut website [github repository](https://github.com/cafebedouin/sigmanauts). 

## Modifying the site

Anyone is encouraged to add information or functionality to the website. To do so: 

1. [Install Hugo](https://gohugo.io/installation/) on your operating system
2. If not already installed, [install git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git).
3. If you do not already have a github account, [sign-up for one](https://docs.github.com/en/get-started/signing-up-for-github/signing-up-for-a-new-github-account)
4. [Fork this repository](https://docs.github.com/en/get-started/quickstart/fork-a-repo) 
5. Make the changes you want to add. This will typically involve one or more of the following:

	* Changing menus on the main page, by changing config.toml
	* Changing the logo, change both config.toml and adding logo to /public/img/new_logo.png (square dimensions)
	* Adding a page under /content/new_file.md
	
6. Preview changes after making them on your computer:

	* $ hugo -D server
	* View in web browser, typically at: [http://localhost:1313](http://localhost:1313)
	
7. Once you have checked the changes, you can create a pull request using git. From the command line it might look like the following sequence of commands:

	* $ git fetch (updates your repo)
	* $ git pull (gets new files)
	* $ git status (shows your changes)
	* $ git add filename(s) 
	* $ git commit -m "Explain what you have done."
	* $ git push (sends changes to your forked repo)
	
8. Once the changes are in your repository, you can then create a pull request to have your changes added to the original repository.

