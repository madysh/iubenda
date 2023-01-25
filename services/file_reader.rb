class FileReader
  def self.read(file_name)
    File.read(file_name)
  rescue Errno::ENOENT
    nil
  end
end
