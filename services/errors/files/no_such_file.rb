require_relative "../base"

class Errors
  class File
    class NoSuchFile < Errors::Base
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
