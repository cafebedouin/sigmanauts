# sigmanauts.com

This repository serves two purposes:

1. It is the official repository of Ergo's Sigmanaut program, which will eventually become a decentralized, autonomous organization.

2. There will be a general need for DAOs on ERGO to have a turn-key solution to create a website and manage important documents, proposals and other information relevant to the DAO. By cloning this repository and making a few modifications using [markdown](https://en.wikipedia.org/wiki/Markdown), new organizations can launch a website on github.io without a need to buy a server, design a website, etc.

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
	
8. Once the changes are in your repository, you can then, either: 

	1. Create a pull request to have your changes added to the original repository, or
	2. Use this template to create a new community of your own

For those using this repository to create their own site, consult Hugo's [Host on Github](https://docs.github.com/en/pages/quickstart) guide for creating your own site. 


