require './api_handler'

class Booksr
	def self.search(query_string, query_type, query_sources)
		if query_type == :title
			
		elsif query_type == :author
				
		elsif query_type == :isbn
			api = ApiHandler.new
			books = api.search_by_google(query_string, query_type)
		elsif query_type == :keyword

		end

		return books
	end
end
