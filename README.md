# Log analyzer

## Description

Analyzes given webserver.log file and presents statistics:
- ordered lists of webpages with most page views
- ordered lists of webpages with most unique page views

## Setup

Run `bundle install`

## Usage

`exe/analyzer webserver.log`

## rspec

To run all tests use `bundle exec rspec`

## rubocop

To run code analyzer use `bundle exec rubocop`

## Implementation

Analyzer have 3 main classes:

### Runner

Class responsible for validating file_path presence and presenting results.

### ParsedLogfile

ParseLogfile reads file and gathers statistics. On initialization it analyzes data and have public methods for ordered collections.<br>
File is being read line by line and values are passed to proper `Url` objects.

### Url

Url represents one url address with information about its occurences in logfile.<br>
Thanks to `new_occurence` method and `Set` it stores only necessery data.
