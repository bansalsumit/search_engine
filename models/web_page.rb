require_relative 'keyword'

class WebPage
  @@page_count = 0

  attr_reader :attach_keywords

  def initialize
    @@page_count += 1
    @id = @@page_count
    @attach_keywords = []
  end

  def add_keyword(name)
    @attach_keywords << Keyword.new(name)
  end
end
