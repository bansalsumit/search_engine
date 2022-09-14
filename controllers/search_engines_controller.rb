require_relative '../models/web_page';

class SearchEngine

  def initialize
    @pages = []
  end

  def add_web_page(keywords)
    @pages << WebPage.new()
  end
end
