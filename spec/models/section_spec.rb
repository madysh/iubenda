require_relative "../../models/section"

RSpec.describe Section do
  it { is_expected.to respond_to(:id, :clauses_ids) }
end
