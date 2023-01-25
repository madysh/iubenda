require_relative "./errors/invalid_argument"

class TagsScanner
  PATTERNS = [
    CLAUSE_PATTERN = /\[CLAUSE-(\d+)\]/,
    SECTION_PATTERN = /\[SECTION-(\d+)\]/
  ]

  def initialize(text)
    @text = text
  end

  def scan_ids(type)
    pattern = pattern(type)

    text.scan(pattern).flatten.map(&:to_i).uniq
  end

  private

  attr_reader :text

  def pattern(type)
    {
      clause: CLAUSE_PATTERN,
      section: SECTION_PATTERN,
    }[type] || raise(Errors::InvalidArgument, "TagsScanner does not support #{type} type")
  end
end
