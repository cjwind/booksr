#encoding: utf-8

require 'test/unit'
require './booksr'
require './book'

class TestSearchAuthorByGoogleApi1 < Test::Unit::TestCase
	def setup	# will be called before run each member function
		@books = Booksr.search("娥蘇拉勒瑰恩", :author)
	end

	def test_results
		assert_equal(5, @books.size)

		assert_equal("地海傳說: 地海奇風", @books[0].title)
		assert_equal("地海傳說: 地海孤雛", @books[1].title)
		assert_equal("地海傳說: 地海巫師", @books[2].title)
		assert_equal("地海傳說: 地海故事集", @books[3].title)
		assert_equal("地海傳說: 地海古墓", @books[4].title)
	end
end

class TestSearchAuthorByGoogleApi2 < Test::Unit::TestCase
	def setup
		@books = Booksr.search("侯文詠", :author)
	end

	def test_result_count_when_over_40
		assert_equal(42, @books.size)
	end
end