require 'rest-client'
require 'json'

class Book
    attr_reader :title, :subtitle, :authors, :publisher, :published_date, :description
    attr_reader :isbn10, :isbn13, :page_count, :language

    def initialize(isbn)
        # TODO get book info by Google Book API with isbn

        response = RestClient.get "https://www.googleapis.com/books/v1/volumes?q=isbn:#{isbn}"

        data = JSON.parse(response)
    end
end
