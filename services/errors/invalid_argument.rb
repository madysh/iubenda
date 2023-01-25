require_relative "base"

class Errors
  class InvalidArgument < Errors::Base
    def initialize(msg="Invalid argument passed")
      super
    end
  end
end
