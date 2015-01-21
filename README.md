# Booksr #

A simple book searcher in Ruby.


## Installation ##

`gem install booksr`


## Usage ##

books = Booksr.search(query_string, query_type)

`query_type` can be:

* `:title`
* `:author`
* `:isbn`
* `:keyword`

default is :keyword

query_string of isbn can be ISBN10 or ISBN13.

books is array of `Book` which can retrieve book information.


## Example ##

books = Booksr.search('Ruby on Rails', :title)

