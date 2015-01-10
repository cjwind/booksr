#encoding: utf-8

require 'rest-client'
require './parser'

class ApiHandler
	GOOGLE_MAX_RESULTS = 40	# const

	def search_by_google(query_string, query_type)
		api_uri = "https://www.googleapis.com/books/v1/volumes"
		responses = Array.new
		parser = Parser.new

		if query_type == :title
			title = URI::escape(query_string)
			start_index = 0

			begin
				query = "?q=intitle:#{title}&startIndex=#{start_index}&maxResults=#{GOOGLE_MAX_RESULTS}"
				
				response = RestClient.get api_uri + query
				responses.push(response)
				
				data = parser.parse_json(response)
				start_index += GOOGLE_MAX_RESULTS
			end while data.size == GOOGLE_MAX_RESULTS
		elsif query_type == :author
			author = URI::escape(query_string)
			start_index = 0

			begin
				query = "?q=inauthor:#{author}&startIndex=#{start_index}&maxResults=#{GOOGLE_MAX_RESULTS}"
				
				response = RestClient.get api_uri + query
				responses.push(response)
				
				data = parser.parse_json(response)
				start_index += GOOGLE_MAX_RESULTS
			end while data.size == GOOGLE_MAX_RESULTS
		elsif query_type == :isbn
			isbn = query_string
			query = "?q=isbn:#{isbn}"

			response = RestClient.get api_uri + query
			responses.push(response)
		elsif query_type == :keyword

		end

		return responses
	end

	def search_by_isbndb(query_string, query_type)

	end

	def search_by_amazon(query_string, query_type)

	end
end
