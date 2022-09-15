require_relative '../../models/web_page'
require 'test/unit'

class WebPageTest < Test::Unit::TestCase
  def test_add_web_page
    web_page = WebPage.new()

    assert_equal(WebPage, web_page.class)
  end

  def test_add_keyword
    web_page = WebPage.new()
    web_page.add_keyword('Review')

    assert_equal(web_page.attach_keywords.first.name, 'review')
  end

  def test_find_match_pages_for_keywords
    pages = []
    web_page1 = WebPage.new()
    web_page1.add_keyword('Review')
    web_page2 = WebPage.new()
    web_page2.add_keyword('Review')
    web_page2.add_keyword('Car')
    pages << web_page1
    pages << web_page2
    matched_pages = WebPage.find_match_pages_for_keywords(['review'], pages)

    assert_equal(matched_pages.count, 2)
  end
end
