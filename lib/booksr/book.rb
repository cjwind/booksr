class Booksr
  class Book
    attr_reader :title, :subtitle, :authors, :publisher, :published_date, :description
    attr_reader :isbn10, :isbn13, :page_count, :lang

    def initialize(info)
      @title = info[:title]
      @subtitle = info[:subtitle]
      @authors = info[:authors]
      @published_date = info[:published_date]
      @publisher = info[:publisher]
      @description = info[:description]
      @page_count = info[:page_count]
      @lang = info[:lang]
      @isbn13 = info[:isbn13]
      @isbn10 = info[:isbn10]
    end
  end
end
