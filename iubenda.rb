require "./services/data_initializer"
require "./services/errors/base"

begin
  DataInitializer.new.load
rescue Errors::Base => e
  puts e.message
end
