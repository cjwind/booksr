require './api_handler'
require './parser'

class Booksr
	def self.search(query_string, query_type)
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