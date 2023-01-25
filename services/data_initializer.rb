require_relative "./data_loader"
require_relative "./file_reader"
require_relative "../models/clause"
require_relative "../models/section"
require_relative "../models/template"

class DataInitializer
  DATA_FOLDER = './data/'.freeze

  def load
    {
      clauses: clauses,
      sections: sections,
      template: template
    }
  end

  private

  def file_path(file_name)
    "#{DATA_FOLDER}#{file_name}"
  end

  def template
    text = FileReader.new(file_path("template.txt")).read

    Template.new(text)
  end

  def clauses
    DataLoader.new(file_path("clauses.json"), ::Clause).load
  end

  def sections
    DataLoader.new(file_path("sections.json"), ::Section).load
  end
end