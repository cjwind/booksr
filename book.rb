require 'rest-client'
require 'json'

class Book
    attr_reader :title, :subtitle, :authors, :publisher, :published_date, :description
    attr_reader :isbn10, :isbn13, :page_count, :language

    def initialize(isbn)
        # TODO get book info by Google Book API with isbn

        response = RestClient.get "https://www.googleapis.com/books/v1/volumes?q=isbn:#{isbn}"

        data = JSON.parse(response)
        bookInfo = data["items"][0]["volumeInfo"]

        @title = bookInfo["title"]
        @subtitle = bookInfo["subtitle"]
        @authors = bookInfo["authors"]
        @published_date = bookInfo["publishedDate"]
        @description = bookInfo["description"]
        @isbn10 = bookInfo["industryIdentifiers"]
    end
end
