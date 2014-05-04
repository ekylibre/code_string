# CodeString is string with an indicator of the manipulated language
# It permits to secure concantenation
# Code strings simplifies code displaying
class CodeString < String

  VERSION = "0.0.0"

  class IncompatibleLanguage < StandardError
  end

  @@default_language = :ruby

  class << self
    attr_accessor :default_language
  end

  attr_reader :language

  def initialize(text, language = nil)
    @language = language || @@default_language
    super(text)
  end

  def +(text)
    if text.is_a?(CodeString)
      if self.language == text.language
        super text
      else
        raise IncompatibleLanguage, "Language #{self.language} is not compatible with language: #{text.language}"
      end
    else
      super text
    end
  end

  def <<(text)
    if text.is_a?(CodeString)
      if self.language == text.language
        super text
      else
        raise IncompatibleLanguage, "Language #{self.language} is not compatible with language: #{text.language}"
      end
    else
      super text.to_s
    end
  end

  def to_formatted_s
    string, index = "", 1
    string << "# language: #{language}\n"
    string << "# encoding: #{encoding}\n"
    for line in self.split(/\n/)
      string  << index.to_s.rjust(4) + ": " + line + "\n"
      index += 1
    end
    return string
  end

  def inspect
    self.to_s
  end

  def dig(*args)
    options = args.last.is_a?(Hash) ? args.delete_at(-1) : {}
    depth   = args.shift || options[:depth] || 1
    spacer  = args.shift || options[:spacer] || "  "
    return (self.strip.gsub(/^/, spacer * depth) + "\n").c(@language)
  end

end


class ::String
  # Convert a String to a Code fragment
  def to_code(language = nil)
    CodeString.new(self, language)
  end

  def c(language = nil)
    CodeString.new(self, language)
  end
end
