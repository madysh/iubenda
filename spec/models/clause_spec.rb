require_relative "../../models/clause"

describe Clause do
  it { is_expected.to respond_to(:id, :text) }
end
