class ::String
  # Convert a String to a Code fragment
  def to_code(language = nil)
    CodeString.new(self, language)
  end

  def c(language = nil)
    CodeString.new(self, language)
  end
end
