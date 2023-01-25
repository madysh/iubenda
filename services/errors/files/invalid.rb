class Errors
  class File
    class Invalid < StandardError
      def initialize(msg="Invalid file")
        super
      end
    end
  end
end
