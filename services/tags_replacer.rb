require_relative "./tags_scanner"

class TagsReplacer
  SECTIONS_SEPARATOR = ";".freeze

  def initialize(data)
    define_data_instances(data)
    @result = template.text
    @tags_scanner = TagsScanner.new(template.text)
  end

  def replace
    replace_clauses!
    replace_sections!

    result
  end

  private

  attr_reader :template, :clauses, :sections, :result, :tags_scanner

  def define_data_instances(data)
    @template = data[:template]
    @clauses = data[:clauses]
    @sections = data[:sections]
  end

  def replace_clauses!
    clauses_ids = tags_scanner.scan_ids(:clause)

    clauses_ids.each do |i|
      next unless clauses[i]

      result.gsub!(/\[CLAUSE-#{i}\]/, clauses[i].text)
    end
  end

  def replace_sections!
    sections_ids = tags_scanner.scan_ids(:section)

    sections_ids.each do |i|
      next unless sections[i]

      section = replace_section(sections[i].clauses_ids)

      result.gsub!(/\[SECTION-#{i}\]/, section)
    end
  end

  def replace_section(clauses_ids)
    replaced_clauses = clauses_ids.map { |i| clauses[i]&.text || "[CLAUSE-#{i}]" }
    replaced_clauses.join(SECTIONS_SEPARATOR)
  end
end
