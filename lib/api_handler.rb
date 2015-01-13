#encoding: utf-8

require 'rest-client'
require './parser'

class ApiHandler
	GOOGLE_MAX_RESULTS = 40	# const

	def search_by_google(query_string, query_type)
		responses = Array.new
		parser = Parser.new

		# https://www.googleapis.com/books/v1/volumes?q=field:qeury_string&startIndex=#{start_index}&maxResults=#{GOOGLE_MAX_RESULTS}
		query_string = URI::escape(query_string)
		api_uri = "https://www.googleapis.com/books/v1/volumes"
		query = "?q="

		if query_type == :title
			query += "intitle:"
		elsif query_type == :author
			query += "inauthor:"
		elsif query_type == :isbn
			query += "isbn:"
		end

		query += query_string

		start_index = 0
		begin
			subquery = "&startIndex=#{start_index}&maxResults=#{GOOGLE_MAX_RESULTS}"

			response = RestClient.get api_uri + query + subquery
			responses.push(response)
			
			data = parser.parse_json(response)
			start_index += GOOGLE_MAX_RESULTS
		end while data.size == GOOGLE_MAX_RESULTS

		return responses
	end
end