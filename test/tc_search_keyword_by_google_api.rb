#encoding: utf-8

require 'test/unit'
require './booksr'
require './book'

class TestSearchKeywordByGoogleApi1 < Test::Unit::TestCase
	def setup	# will be called before run each member function
		@books = Booksr.search("程式設計", :keyword, [:google])
	end

	def test_result_count
		assert_operator(500, :<=, @books.size)
	end
end