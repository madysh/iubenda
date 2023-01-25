require_relative "./errors/file/no_such_file"

class FileReader
  attr_reader :file_path

  def initialize(file_path)
    @file_path = file_path
  end

  def read
    exists? && File.read(file_path)
  end

  def exists?
    File.file?(file_path) || raise Errors::File::NoSuchFile.new(file_path)
  end
end
