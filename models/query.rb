require_relative 'keyword'

class Query
  @@query_count = 0

  attr_reader :attach_keywords

  def initialize
    @@query_count += 1
    @id = @@query_count
    @attach_keywords = []
    @keyword_weightage = 8
  end

  def add_keyword(name)
    @attach_keywords << Keyword.new(name, @keyword_weightage)
    @keyword_weightage -= 1
  end

  def find_top_five_pages(pages)
    pages.sort_by do |page|
      page.attach_keywords.sum(0) do |key|
        key.weightage * (Keyword.find_keyword(key.name, attach_keywords)&.weightage || 0) * -1
      end
    end
  end
end
