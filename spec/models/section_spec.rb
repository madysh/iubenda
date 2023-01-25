require_relative "../../models/section"

describe Section do
  it { is_expected.to respond_to(:id, :clauses_ids) }
end
