#encoding: utf-8

require 'rest-client'
require 'json'
require './book'

class ApiHandler
	def search_by_google(query_string, query_type)
		api_uri = "https://www.googleapis.com/books/v1/volumes"

		if query_type == :title

		elsif query_type == :author
			author = URI::escape(query_string)
			query = "?q=inauthor:#{author}"
		elsif query_type == :isbn
			isbn = query_string
			query = "?q=isbn:#{isbn}"
		elsif query_type == :keyword

		end

		response = RestClient.get api_uri + query
		data = JSON.parse(response)
		volumes = data["items"]

		books = Array.new
		volumes.each do |volume|
			volume_info = volume["volumeInfo"]
	        books.push(Book.new(parse_info_from_google(volume_info)))
		end

		return books
	end

	def parse_info_from_google(volume_info)
		info = Hash.new

        info[:title] = volume_info["title"]
        info[:subtitle] = volume_info["subtitle"]
        info[:authors] = volume_info["authors"]
        info[:published_date] = volume_info["publishedDate"]
        info[:publisher] = volume_info["publisher"]
        info[:description] = volume_info["description"]
        info[:page_count] = volume_info["pageCount"]
        info[:lang] = volume_info["language"]

        isbns = volume_info["industryIdentifiers"]
        isbns.each do |isbn|
            if isbn["type"] == "ISBN_13"
                info[:isbn13] = isbn["identifier"]
            elsif isbn["type"] == "ISBN_10"
                info[:isbn10] = isbn["identifier"]
            end
        end

        return info
	end

	def search_by_isbndb(query_string, query_type)

	end

	def search_by_amazon(query_string, query_type)

	end
end