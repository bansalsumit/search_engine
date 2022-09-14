require_relative '../models/web_page';
require_relative '../models/query';

class SearchEngine
  attr_reader :pages, :queries

  def initialize
    @pages = []
    @queries = []
  end

  def add_web_page(keywords)
    page = WebPage.new()
    keywords.each do |keyword|
      page.add_keyword(keyword)
    end
    @pages << page
  end

  def add_search_query(keywords)
    query = Query.new()
    keywords.each do |keyword|
      query.add_keyword(keyword)
    end
    @queries << query
  end
end
