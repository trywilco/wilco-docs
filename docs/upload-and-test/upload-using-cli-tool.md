---
title: Upload using a command line tool
parent: Uploading and Testing Your Quest
---


# Upload using a command line tool

A command line tool can be used to automate the process of zipping and uploading a quest

Download the executable according to the operating system you use:

* [Windows]
* [Mac]
* [Linux]

The following arguments are supported:

	--questFolder:
	    Path to the quest folder.
		
	--token:
	    The creator token. See below for instructions for how to generate this token.
		
	--email:
	    The user's email in Wilco.

	--mode		
	    once: upload and exit. This is the default mode.
	    watch: waits for changes in the quest files and suggets to upload.  



To generate the creator token:
1. Go to the [Quest Builder Utilities](https://app.wilco.gg/quest-builder-utils)
2. Generate a Quest Developer token by selecting the `Generate New Token` option. 
    - Make sure to save your token because it will only be shown once. 


[Windows]: {% link docs/upload-and-test/upload-quest-cli/upload_quest-win.exe %}
[Mac]: {% link docs/upload-and-test/upload-quest-cli/upload_quest-macos %}
[Linux]: {% link docs/upload-and-test/upload-quest-cli/upload_quest-linux %}
