require './api_handler'
require './parser'

class Booksr
	def self.search(query_string, query_type, query_sources)
		api = ApiHandler.new
		parser = Parser.new
		books = Array.new

		json = api.search_by_google(query_string, query_type)
		volumes = parser.parse_json(json)
		
		volumes.each do |volume|
			volume_info = volume["volumeInfo"]
	        books.push(Book.new(parser.parse_info_from_google(volume_info)))
		end

		return books
	end
end