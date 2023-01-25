require_relative "../../models/clause"
require_relative "../../services/data_loader"
require_relative "../../services/errors/files/invalid"

describe DataLoader do
  let(:instance) { described_class.new(file_path, klass) }
  let(:file_name) { "valid_json.json" }
  let(:file_path) { File.join(File.dirname(__FILE__), "../fixtures/", file_name) }
  let(:klass) { Clause }

  describe "#load" do
    subject { instance.load }

    context "with path to valid json file" do
      it "returns an array of loaded instances" do
        is_expected.to eq [Clause.new(id: 1, text: "test")]
      end
    end

    shared_examples "with Errors::File::Invalid error" do
      it "raises Errors::File::Invalid error" do
        expect { subject }
          .to raise_error(Errors::File::Invalid, "File #{file_path} is invalid json")
      end
    end

    context "with path to invalid json file" do
      let(:file_name) { "invalid_json.json" }

      it_behaves_like "with Errors::File::Invalid error"
    end

    context "with path to not json file" do
      let(:file_name) { "txt_example.txt" }

      it_behaves_like "with Errors::File::Invalid error"
    end
  end
end
