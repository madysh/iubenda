class Errors
  class File
    class NoSuchFile < StandardError
      attr_reader :file_path

      def initialize(file_path)
        @file_path = file_path
      end

      def to_s
        "No such file #{file_path}"
      end
    end
  end
end
