#encoding: utf-8

require 'test/unit'
require 'booksr'

class TestSearchIsbnByGoogleApi1 < Test::Unit::TestCase
	def setup	# will be called before run each member function
		@books = Booksr.search("0131230522", :isbn)
	end

	def test_result
		assert_equal(1, @books.size)

		@book = @books[0]

		assert_equal("Unix Network Programming Volume 1: the Sockets Networking API", @book.title)
		assert_equal("International Edition", @book.subtitle)
	
		assert_equal(4, @book.authors.size)
		assert(@book.authors.include?("Stevens Richard"))
		assert(@book.authors.include?("W. Richard Stevens"))
		assert(@book.authors.include?("Bill Fenner"))
		assert(@book.authors.include?("Andrew M. Rudoff"))
	
		assert_equal(nil, @book.publisher)
		assert_equal("2004", @book.published_date)
		assert_equal(nil, @book.description)
		assert_equal("0131230522", @book.isbn10)
		assert_equal("9780131230521", @book.isbn13)
		assert_equal(991, @book.page_count)
		assert_equal("en", @book.lang)
	end
end

class TestSearchIsbnByGoogleApi2 < Test::Unit::TestCase
	def setup	# will be called before run each member function
		@books = Booksr.search("9789866841590", :isbn)
	end

	def test_result
		assert_equal(1, @books.size)

		@book = @books[0]

		assert_equal("你的孩子不是你的孩子", @book.title)
		assert_equal("被考試綁架的家庭故事──一位家教老師的見證", @book.subtitle)
	
		assert_equal(1, @book.authors.size)
		assert_equal("吳曉樂", @book.authors[0])
	
		assert_equal("英屬蓋曼群島商網路與書出版股份有限公司臺灣分公司", @book.publisher)
		assert_equal("2014-11-01", @book.published_date)
		assert_equal("沒有一篇是普羅大眾樂見的教育神話。 沒有一篇看了會感到喜悅。 沒有一篇看了心中不會亂糟糟的，甚至覺得煩。 然而，這些事情確實發生過。 不僅確實發生過，極可能仍在發生⋯⋯ 說故事的人，是個證人。她花了七年時間，打開一扇又一扇的大門，走進不同的家庭。在門的背後，她見證了各色光怪陸離的景象：一個每日給兒子準備雞精、維他命的母親，在收到兒子成績單的當下，卻也毫不猶豫地甩出一記耳光；為了安撫雙親，躲在衣櫃裡欺騙別人也傷害自己的兒子；也或許，她看見一種用鈔票堆疊起來的親情⋯⋯她以為她是家教，只需帶給學生知識，沒想到學生及他們的家庭帶給她更多的衝擊。 什麼是教育的本質？愛是有條件的嗎？ 本書沒有給家長教條式的叮嚀與建議，只有一個個震撼人心的故事。這些故事之所以存在，是期待我們去凝視一個初衷，靜下來，好好想想，把小孩帶到這世界上的初衷。 ■ 被考試綁架的家庭故事——《你的孩子不是你的孩子》新書座談會 講者：吳曉樂（本書作者） 時間：2014年11月29日（六）11:00~12:00 地點：水牛書店 ■ 每個孩子都是獨立的個體——《你的孩子不是你的孩子》新書座談會 講者：吳曉樂（本書作者）、唐光華（樂觀書院創辦人） 時間：2014年12月4日（四）19:30~21:00 地點：誠品信義店3F Mini-Forum", @book.description)
		assert_equal("9866841596", @book.isbn10)
		assert_equal("9789866841590", @book.isbn13)
		assert_equal(328, @book.page_count)
		assert_equal("zh-TW", @book.lang)
	end
end