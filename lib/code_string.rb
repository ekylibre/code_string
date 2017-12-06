# CodeString is string with an indicator of the manipulated language
# It permits to secure concantenation
# Code strings simplifies code displaying
class CodeString < String
  VERSION = '0.0.2'.freeze

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
      if language == text.language
        super text
      else
        raise IncompatibleLanguage, "Language #{language} is not compatible with language: #{text.language}"
      end
    else
      super text
    end
  end

  def <<(text)
    if text.is_a?(CodeString)
      if language == text.language
        super text
      else
        raise IncompatibleLanguage, "Language #{language} is not compatible with language: #{text.language}"
      end
    else
      super text.to_s
    end
  end

  def to_formatted_s
    string = ''
    index = 1
    string << "# language: #{language}\n"
    string << "# encoding: #{encoding}\n"
    for line in split(/\n/)
      string << index.to_s.rjust(4) + ': ' + line + "\n"
      index += 1
    end
    string
  end

  def inspect
    to_s
  end

  def dig(*args)
    options = args.last.is_a?(Hash) ? args.delete_at(-1) : {}
    depth   = args.shift || options[:depth] || 1
    spacer  = args.shift || options[:spacer] || '  '
    (strip.gsub(/^/, spacer * depth) + "\n").c(@language)
  end
end

require 'code_string/core_ext'
