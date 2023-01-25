require "./services/data_initializer"
require "./services/tags_replacer"
require "./services/errors/base"

begin
  data = DataInitializer.new.load
  print TagsReplacer.new(data).replace
rescue Errors::Base => e
  puts e.message
end
