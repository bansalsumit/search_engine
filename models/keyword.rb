class Keyword
  attr_reader :name, :weightage

  def initialize(name, weightage)
    @name = name.downcase
    @weightage = weightage
  end

  def self.find_keyword(name, keywords)
    keywords.find{ |key| key.name == name }
  end

  def self.get_attach_keywords(obj)
    obj.attach_keywords.map(&:name)
  end
end
