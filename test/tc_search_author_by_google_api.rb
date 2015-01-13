#encoding: utf-8

require 'test/unit'
require 'booksr'

class TestSearchAuthorByGoogleApi < Test::Unit::TestCase
	def setup
		@author = "張愛玲"
		@books = Booksr.search(@author, :author)
	end

	def test_result_count
		assert_operator(40, :<=, @books.size)
	end
end