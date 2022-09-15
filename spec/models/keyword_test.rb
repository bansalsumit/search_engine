require_relative '../../models/keyword'
require_relative '../../models/query'
require 'test/unit'

class KeywordTest < Test::Unit::TestCase
  def test_add_key_word
    keyword = Keyword.new('Ford', 2)

    assert_equal(Keyword, keyword.class)
  end

  def test_argument_mismatch
    assert_raise( ArgumentError ) { Keyword.new('Ford') }
  end

  def test_find_keyword
    attach_keywords = []
    ford_keyword = Keyword.new('Ford', 2)
    attach_keywords << ford_keyword
    attach_keywords << Keyword.new('Review', 3)
    find_keyword = Keyword.find_keyword('ford', attach_keywords)

    assert_equal(find_keyword.name, ford_keyword.name)
  end

  def test_get_attach_keywords
    query = Query.new()
    query.add_keyword('Review')
    query.add_keyword('Car')

    assert_equal(Keyword.get_attach_keywords(query), ['review', 'car'])
  end
end
