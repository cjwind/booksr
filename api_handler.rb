#encoding: utf-8

require 'rest-client'

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

		return response
	end

	def search_by_isbndb(query_string, query_type)

	end

	def search_by_amazon(query_string, query_type)

	end
end