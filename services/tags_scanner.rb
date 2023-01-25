class TagsScanner
  PATTERNS = [
    CLAUSE_PATTERN = /\[CLAUSE-(\d+)\]/,
    SECTION_PATTERN = /\[SECTION-(\d+)\]/
  ]

  def initialize(text)
    @text = text
  end

  def scan_ids(type)
    pattern = {
      clause: CLAUSE_PATTERN,
      section: SECTION_PATTERN,
    }[type]

    @text.scan(pattern).flatten.map(&:to_i).uniq
  end
end
