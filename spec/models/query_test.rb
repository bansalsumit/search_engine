require_relative '../../models/query'
require_relative '../../models/web_page'
require 'test/unit'

class QueryTest < Test::Unit::TestCase
  def test_add_query
    query = Query.new()

    assert_equal(Query, query.class)
  end

  def test_add_keyword
    query = Query.new()
    query.add_keyword('Review')

    assert_equal(query.attach_keywords.first.name, 'review')
  end

  def test_find_top_five_pages
    query = Query.new()
    query.add_keyword('Car')
    pages = []
    web_page1 = WebPage.new()
    web_page1.add_keyword('Review')
    web_page2 = WebPage.new()
    web_page2.add_keyword('Review')
    web_page2.add_keyword('Car')
    pages << web_page1
    pages << web_page2
    pages = query.find_top_five_pages(pages)

    assert_equal(pages.first.id, web_page2.id)
  end
end
