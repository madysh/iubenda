require_relative "../../services/file_reader"
require_relative "../../services/errors/files/no_such_file"

describe FileReader do
  let(:instance) { described_class.new(file_path) }
  let(:valid_file_name) { "valid_json.json" }
  let(:missed_file_name) { "missed_file.json" }
  let(:file_path) { File.join(File.dirname(__FILE__), "../fixtures/", file_name) }

  shared_examples "with Errors::File::NoSuchFile error" do
    it "raises Errors::File::NoSuchFile error" do
      expect { subject }
        .to raise_error(Errors::File::NoSuchFile, "No such file #{file_path}")
    end
  end

  describe "#exists?" do
    subject { instance.exists? }

    context "with path to exising file" do
      let(:file_name) { valid_file_name }

      it { is_expected.to eq true }
    end

    context "with path to missed file" do
      let(:file_name) { missed_file_name }

      it_behaves_like "with Errors::File::NoSuchFile error"
    end
  end

  describe "#read" do
    subject { instance.read }

    context "with path to exising file" do
      let(:file_name) { valid_file_name }

      it "reads the file" do
        is_expected.to eq File.read(file_path)
      end
    end

    context "with path to missed file" do
      let(:file_name) { missed_file_name }

      it_behaves_like "with Errors::File::NoSuchFile error"
    end
  end
end
