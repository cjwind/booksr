require 'json'
require 'rest-client'

require 'booksr/api_handler'
require 'booksr/parser'
require 'booksr/book'

class Booksr
  def self.search(query_string, query_type = :keyword)
    accepted_type = [:title, :author, :isbn, :keyword]
    if !accepted_type.include?(query_type)
      return nil
    end

    api = ApiHandler.new
    parser = Parser.new
    books = Array.new

    responses = api.search_by_google(query_string, query_type)
    responses.each do |response|
      volumes = parser.parse_json(response)

      volumes.each do |volume|
        volume_info = volume["volumeInfo"]
            books.push(Book.new(parser.parse_info_from_google(volume_info)))
      end
    end

    return books
  end
end
