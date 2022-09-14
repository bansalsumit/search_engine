require_relative 'keyword'

class WebPage
  @@page_count = 0

  attr_reader :id, :attach_keywords

  def initialize
    @@page_count += 1
    @id = @@page_count
    @attach_keywords = []
    @keyword_weightage = 8
  end

  def add_keyword(name)
    @attach_keywords << Keyword.new(name, @keyword_weightage)
    @keyword_weightage -= 1
  end

  def self.find_match_pages_for_keywords(keywords, pages)
    pages.select do |page|
      (Keyword.get_attach_keywords(page) & keywords).size > 0
    end
  end
end
