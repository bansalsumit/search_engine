class General
  def extract_keywords(str)
    arr = str.split(' ')
    arr.slice!(0)
    arr
  end

  def is_page_input?(str)
    str.start_with?('P')
  end

  def is_query_input?(str)
    str.start_with?('Q')
  end
end
