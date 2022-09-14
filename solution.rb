require 'pry';
require_relative 'controllers/search_engines_controller'
require_relative 'helpers/general'


p 'Please enter the pages and Queries'

web_pages_and_queries = ["P Ford Review Car", "P Review Car", "Q Car", "Q Ford", "Q Review"]
# Uncomment this block
# loop do
#   input = gets.chop
#   break if input.empty?
#   web_pages_and_queries << input
# end
search_engine = SearchEngine.new()
general_helper = General.new()
web_pages_and_queries.each do |input|
  if general_helper.is_page_input?(input)
    search_engine.add_web_page(general_helper.extract_keywords(input))
  end
end

search_results = []
web_pages_and_queries.each do |input|
  if general_helper.is_query_input?(input)
    search_results << search_engine.add_search_query(general_helper.extract_keywords(input))
  end
end
search_engine.get_queries_result.each do |e|
  p e
  puts "\n"
end
# binding.pry
