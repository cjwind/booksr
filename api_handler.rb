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
			response = RestClient.get api_uri + query

			data = JSON.parse(response)
			puts data["totalItems"]
			volumes = data["items"]
			puts volumes.size

			volumes.each do |volume|
				volume_info = volume["volumeInfo"]

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

		        books = Array.new
		        books.push(Book.new(info))
			end
		elsif query_type == :isbn
			isbn = query_string
			query = "?q=isbn:#{isbn}"
			response = RestClient.get api_uri + query

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
