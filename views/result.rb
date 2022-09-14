class Result
  def self.print_query_pages(result)
    p 'Query result'
    p '-'*20
    result.each do |query, pages|
      p "Q#{query.id} " + pages.map{|page|"P#{page.id} "}.join('')
    end
  end
end
