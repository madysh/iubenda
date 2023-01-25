require_relative "./errors/files/invalid"
require_relative "./file_reader"

class DataLoader
  def initialize(file_path, klass)
    @file_path = file_path
    @klass = klass
  end

  def load
    require 'json'

    JSON.parse(file, object_class: klass)
  rescue JSON::ParserError
    raise Errors::File::Invalid, "File #{file_path} is invalid json"
  end

  private

  attr_reader :file_path, :klass

  def file
    FileReader.new(file_path).read
  end
end
