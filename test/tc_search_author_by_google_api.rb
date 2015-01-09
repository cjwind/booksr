#encoding: utf-8

require 'test/unit'
require './booksr'
require './book'

class TestSearchAuthorByGoogleApi < Test::Unit::TestCase
	def setup	# will be called before run each member function
		@books = Booksr.search("侯文詠", :author, [:google])
	end

	def test_result_count
	end
end