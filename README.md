# Booksr #

A simple book searcher in Ruby.


## Installation ##

`gem install booksr`


## Usage ##

`books = Booksr.search(query_string, query_type)`

`query_type` can be:

* `:title`
* `:author`
* `:isbn`
* `:keyword`

default is `:keyword`.

`query_string` of `:isbn` can be ISBN10 or ISBN13.

Return value is array of `Book` which can retrieve book information.

Attributes of class `Book`:

* title
* subtitle
* authors: array
* publisher
* published_date
* description
* isbn10
* isbn13
* page_count
* lang


## Example ##

```ruby
require 'booksr'

books = Booksr.search('Ruby on Rails', :title)
book = books[0]

puts book.title
puts book.authors    # authors is a array
puts book.subtitle
```