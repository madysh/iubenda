require_relative "../../services/tags_replacer"
require_relative "../../services/errors/invalid_argument"

describe TagsReplacer do
  let(:template) { "test\n[CLAUSE-1], [CLAUSE-2], [CLAUSE-1]\n[SECTION-1]\nSECTION-2" }
  let(:data) do
    {
      clauses: {
        1 => Clause.new(id: 1, text: "clause_1"),
        2 => Clause.new(id: 2, text: "clause_2")
      },
      sections: {
        1 => Section.new(id: 1, clauses_ids: [2, 1]),
        2 => Section.new(id: 1, clauses_ids: [1])
      },
      template: Template.new(template)
    }
  end
  let(:instance) { described_class.new(data) }

  describe "#replace" do
    subject { instance.replace }

    context "when passed data contains all the necessary information" do
      it "returns replaced template" do
        is_expected
          .to eq "test\nclause_1, clause_2, clause_1\nclause_2;clause_1\nSECTION-2"
      end
    end

    context "when not all clause has been provided" do
      let(:template) { "test\n[CLAUSE-10], [CLAUSE-1]" }

      it "returns replaced template" do
        is_expected.to eq "test\n[CLAUSE-10], clause_1"
      end
    end

    context "when not all sections has been provided" do
      let(:template) { "test\n[nSECTION-10], [SECTION-1]" }

      it "returns replaced template" do
        is_expected.to eq "test\n[nSECTION-10], clause_2;clause_1"
      end
    end
  end
end
