require_relative '../models/web_page';

class SearchEngine
  attr_reader :pages


  def initialize
    @pages = []
  end

  def add_web_page(keywords)
    page = WebPage.new()
    keywords.each do |keyword|
      page.add_keyword(keyword)
    end
    @pages << page
  end
end
