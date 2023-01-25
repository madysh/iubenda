require_relative "./data_loader"
require_relative "./file_reader"
require_relative "../models/clause"
require_relative "../models/section"
require_relative "../models/template"

class DataInitializer
  DATA_FOLDER = './data/'.freeze

  def load
    {
      clauses: load_data("clauses", ::Clause),
      sections: load_data("sections", ::Section),
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

  def load_data(file_name, klass)
    data = DataLoader.new(file_path("#{file_name}.json"), klass).load

    data_to_hash(data)
  end

  def data_to_hash(data)
    data.to_h { |i| [i.id, i] }
  end
end
