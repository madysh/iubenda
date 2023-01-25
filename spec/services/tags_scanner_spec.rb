require_relative "../../services/tags_scanner"
require_relative "../../services/errors/invalid_argument"

describe TagsScanner do
  let(:instance) { described_class.new(text) }
  let(:text) { "test template" }

  describe "#scan_ids" do
    subject { instance.scan_ids(type) }

    shared_examples "with supported type" do |type, marker|
      context "with type #{type}" do
        let(:type) { type }

        context "without #{marker} markers" do
          it "returns an empty array" do
            is_expected.to eq([])
          end
        end

        context "with #{marker} markers" do
          let(:text) do
            "test [#{marker}-0] template #{marker}-11 #{marker} [#{marker}-9][#{marker}-0]"
          end

          it "returns unique array of ids" do
            is_expected.to eq([0,9])
          end
        end
      end
    end

    it_behaves_like "with supported type", :clause, "CLAUSE"
    it_behaves_like "with supported type", :section, "SECTION"

    context "with unsupported type" do
      let(:type) { :type }

      it "raises Errors::InvalidArgument error" do
        expect { subject }
          .to raise_error(Errors::InvalidArgument, "TagsScanner does not support #{type} type")
      end
    end
  end
end
