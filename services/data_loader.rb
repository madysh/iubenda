require_relative "./errors/file/Invalid"
require_relative "./file_reader"

class DataLoader
  DATA_FOLDER = './data/'.freeze

  def initialize(file_name, klass)
    @file_name = file_name
    @klass = klass
  end

  def load
    require 'json'

    JSON.parse(file, object_class: @klass)
  rescue JSON::ParserError
    raise Errors::File::Invalid, "#{file_path} is invalid"
  end

  private

  def file_path
    "#{DATA_FOLDER}#{@file_name}.json"
  end

  def file
    FileReader.new(file_path).read
  end
end
