require './api_handler'

class Booksr
	def self.search(query_string, query_type, query_sources)
		api = ApiHandler.new
		books = api.search_by_google(query_string, query_type)
		return books
	end
end
