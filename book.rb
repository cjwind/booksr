require 'rest-client'

class Book
    attr_reader :title, :subtitle, :authors, :publisher, :published_date, :description
    attr_reader :isbn10, :isbn13, :page_count, :language

    def initialize(isbn)
        # TODO check isbn is isbn10 or isbn13
        # TODO get book info by Google Book API with isbn
    end
end
