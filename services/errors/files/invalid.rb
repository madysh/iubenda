require_relative "../base"

class Errors
  class File
    class Invalid < Errors::Base
      def initialize(msg="Invalid file")
        super
      end
    end
  end
end
