require_relative "../../models/template"

describe Template do
  it { is_expected.to respond_to(:text) }
end
