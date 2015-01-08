#encoding: utf-8

require "test/unit"
require "./book"

class TestBook < Test::Unit::TestCase
	def setup	# will be called before run each member function
		@book = Book.new("9789866841590")
	end

	def test_title
		assert_equal("你的孩子不是你的孩子", @book.title)
	end

	def test_subtitle
		assert_equal("被考試綁架的家庭故事──一位家教老師的見證", @book.subtitle)
	end

	def test_authors

	end

	def test_publisher

	end

	def test_published_date

	end

	def test_description

	end

	def test_isbn10

	end

	def test_isbn13

	end

	def test_page_count

	end

	def test_language

	end
end