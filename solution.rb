require_relative 'controllers/search_engines_controller'
require_relative 'helpers/general'

p 'Please enter the pages and Queries'

web_pages_and_queries = ["P Ford Car Review", "P Review Car", "Q Car"]
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
