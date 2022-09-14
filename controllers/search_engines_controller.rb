require_relative '../models/web_page';
require_relative '../models/query';
require_relative '../models/keyword';
require_relative '../views/result';

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

  def get_queries_result
    result = []
    @queries.each do |query|
      matched_pages = WebPage.find_match_pages_for_keywords(Keyword.get_attach_keywords(query), @pages)
      matched_pages = query.find_top_five_pages(matched_pages)
      result << [query, matched_pages]
    end
    Result.print_query_pages(result)
  end
end
