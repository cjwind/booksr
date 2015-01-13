#encoding: utf-8

require 'test/unit'
require 'booksr'

class TestSearchTitleByGoogleApi < Test::Unit::TestCase
	def setup
		@title = "Ruby on Rails"
		@books = Booksr.search(@title, :title)
	end

	def test_results
		assert_operator(40, :<=, @books.size)
	end
end