require 'rest-client'
require 'json'
require './book'

class ApiHandler
	def search_by_google(query_string, query_type)
		if query_type == :title

		elsif query_type == :author
				
		elsif query_type == :isbn
			isbn = query_string
			response = RestClient.get "https://www.googleapis.com/books/v1/volumes?q=isbn:#{isbn}"

			data = JSON.parse(response)
			volume = data["items"][0]["volumeInfo"]

			info = Hash.new
	        info[:title] = volume["title"]
	        info[:subtitle] = volume["subtitle"]
	        info[:authors] = volume["authors"]
	        info[:published_date] = volume["publishedDate"]
	        info[:publisher] = volume["publisher"]
	        info[:description] = volume["description"]
	        info[:page_count] = volume["pageCount"]
	        info[:lang] = volume["language"]

	        isbns = volume["industryIdentifiers"]
	        isbns.each do |isbn|
	            if isbn["type"] == "ISBN_13"
	                info[:isbn13] = isbn["identifier"]
	            elsif isbn["type"] == "ISBN_10"
	                info[:isbn10] = isbn["identifier"]
	            end
	        end

	        books = Array.new
	        books.push(Book.new(info))
		elsif query_type == :keyword

		end

		return books
	end

	def searchByIsbnDb(query_string, query_type)

	end

	def searchByAmazon(query_string, query_type)

	end
end