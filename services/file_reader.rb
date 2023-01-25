require_relative "./errors/files/no_such_file"

class FileReader
  def initialize(file_path)
    @file_path = file_path
  end

  def read
    exists? && File.read(file_path)
  end

  def exists?
    File.file?(file_path) || raise(Errors::File::NoSuchFile.new(file_path))
  end

  private

  attr_reader :file_path
end
