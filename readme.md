# Requirements:
## emacs
emacs version >= 25.1 (js2 mode, Dired mode, IDO)

## js-mode
For js auto beautify, install:
js-beautify

## markdown mode
For markdown mode, install markdown command.
For Ubuntu, apt-get install markdown

### Getting Markdown to parse in Emacs

```
 $ gem install rdiscount
 $ ln -s /usr/local/bin/rdiscount /usr/local/bin/markdown

```
[emacs markdown](http://hal.case.edu/~rrc/blog/2013/09/23/markdown-mode/)

Of course, you’re not out of the woods yet. Emacs has no idea what to do with the Markdown file. If you try to compile your new document with C-c C-c m then you get a lovely error message that says /bin/bash: markdown: command not found. Well, first you have to install rdiscount with gem gem install rdiscount (You can learn how to set up a ruby environment from Lennu.net). Now that you’ve installed Rdiscount, go back into Emacs and enter in the buffer M-x customize-mode hit Return, then markdown-mode From there a GUI appears. Search for Markdown Command: and enter in rdiscount. Save your changes, and test out your markdown-mode compilation again.
