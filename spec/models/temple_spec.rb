require_relative "../../models/template"

RSpec.describe Template do
  it { is_expected.to respond_to(:text) }
end
