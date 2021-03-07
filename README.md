# slack-mirror

A Slack Export archive mirroring tool that allows you to easily download
your Slack team's export. In conjunction with [slack-export-viewer](https://github.com/hfaran/slack-export-viewer
), you can run your slack locally without Internet access for viewing files posted on
various channels.

## Theory of Operation
Opens each JSON file from the export, finds all links within the fields ***url_private, url_private_download, permalink, permalink_public***, rewrites them to reference a local file:// reference, and then saves the updated JSON files. 


### Windows

Install Windows Subsystem for Linux so you can "wsl" to get a BASH shell, otherwise install [ActivePerl (https://www.activestate.com/products/perl/)  or [Strawberry Perl](https://strawberryperl.com/)

### Linux

> apt-get install build-essential cmake perl git

### Perl

> sudo cpan LWP::Simple<br>
> sudo cpan JSON<br>


### Setup

- Copy slack_export.zip into the same directory as Makefile (top-level)
- Edit slack-mirror Perl script to change documentroot (default /slack)

> make extract<br>
> make install<br>

### Viewing

See [slack-export-viewer](https://github.com/hfaran/slack-export-viewer
), point it at the directory you created (normally /slack/slack_export)
> slack-export-viewer -z /slack/slack_export


### Testing

To refine, revise or play with the code, simply create a new slack_export.zip
and copy it into this folder.

> make clean<br>
> make extract<br>
> make download<br>


### To clean up

>  make clean

