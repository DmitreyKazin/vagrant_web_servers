# vagrant_web_servers

Project purpose is to fetch jewish candle lighting dates with hebcal API, and present them using Apache/nginx webservers.

## Project Directories

- **apache/nginx** --> In both directories you can see the Vagrantfile used, HTML pages, and the provision script (bootstrap.sh).
- **batch_files** --> Scripts to run Vagrant, and open a browser with fecthed data from hebcal API.

## Installation

- Install [Vagrant](https://www.vagrantup.com/docs/installation).
- Choose one of the batch files in "batch_files" directory.
- In the batch file chosen, replace Google Chrome directory.
- Run the batch file.
