#encoding: utf-8

require 'test/unit'
require 'booksr'

class TestSearchKeywordByGoogleApi < Test::Unit::TestCase
	def setup	# will be called before run each member function
		@books = Booksr.search("程式設計", :keyword)
	end

	def test_result_count
		assert_operator(40, :<=, @books.size)
	end
end