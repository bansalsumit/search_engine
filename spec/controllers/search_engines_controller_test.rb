require_relative '../../controllers/search_engines_controller'
require 'test/unit'

class SearchEnginesControllerTest < Test::Unit::TestCase
  def test_create_search_engines
    search_engine = SearchEngine.new()

    assert_equal(SearchEngine, search_engine.class)
  end

  def test_add_web_page
    search_engine = SearchEngine.new()
    search_engine.add_web_page(['Review', 'Car'])

    assert_equal(search_engine.pages.count, 1)
  end

  def test_add_search_query
    search_engine = SearchEngine.new()
    search_engine.add_search_query(['Review', 'Car'])

    assert_equal(search_engine.queries.count, 1)
  end
end
