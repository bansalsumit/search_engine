class WebPage
  @@page_count = 0

  def initialize
    @@page_count += 1
    @id = @@page_count
  end
end
