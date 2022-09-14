class Result
  def self.print_query_pages(result)
    space = ' '*24
    p 'Query' + space + 'result'
    p '-'*20
    result.each do |query, pages|
      p "Q#{query.id} " + pages.map{|page|"P#{page.id} "}.join('')
    end
  end
end
