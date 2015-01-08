require 'rest-client'
require 'json'

class Book
    attr_reader :title, :subtitle, :authors, :publisher, :published_date, :description
    attr_reader :isbn10, :isbn13, :page_count, :lang

    def initialize(isbn)
        response = RestClient.get "https://www.googleapis.com/books/v1/volumes?q=isbn:#{isbn}"

        data = JSON.parse(response)
        bookInfo = data["items"][0]["volumeInfo"]

        @title = bookInfo["title"]
        @subtitle = bookInfo["subtitle"]
        @authors = bookInfo["authors"]
        @published_date = bookInfo["publishedDate"]
        @publisher = bookInfo["publisher"]
        @description = bookInfo["description"]
        @page_count = bookInfo["pageCount"]
        @lang = bookInfo["language"]

        isbns = bookInfo["industryIdentifiers"]
        isbns.each do |isbn|
            if isbn["type"] == "ISBN_13"
                @isbn13 = isbn["identifier"]
            elsif isbn["type"] == "ISBN_10"
                @isbn10 = isbn["identifier"]
            end
        end
    end
end