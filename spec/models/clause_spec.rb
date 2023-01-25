require_relative "../../models/clause"

RSpec.describe Clause do
  it { is_expected.to respond_to(:id, :text) }
end
