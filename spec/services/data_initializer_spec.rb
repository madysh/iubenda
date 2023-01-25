require_relative "../../services/data_initializer"
require_relative "../../services/errors/files/no_such_file"
require_relative "../../services/errors/files/invalid"
require_relative "../../models/template"
require_relative "../../models/clause"
require_relative "../../models/section"

describe DataInitializer do
  let(:instance) { described_class.new }
  let(:data_folder) { "valid_init_data" }
  let(:data_folder_path) { File.join(File.dirname(__FILE__), "../fixtures/", data_folder, '/') }

  before do
    stub_const "DataInitializer::DATA_FOLDER", data_folder_path
  end

  describe "#load" do
    subject { instance.load }

    context "with path to valid init data" do
      it "loads data from files" do
        is_expected.to eq({
          clauses: { 1 => Clause.new(id: 1, text: "The quick brown fox") },
          sections: { 1 => Section.new(id: 1, clauses_ids: [1, 2]) },
          template: Template.new("test\n")
        })
      end
    end

    context "with path to invalid init data" do
      let(:data_folder) { "invalid_init_data" }

      it "raises Errors::File::Invalid error" do
        expect { subject }.to raise_error(
          Errors::File::Invalid, "File #{data_folder_path}clauses.json is invalid json"
        )
      end
    end

    context "with invalid path to init data" do
      let(:data_folder) { "missed" }

      it "raises Errors::File::NoSuchFile error" do
        expect { subject }
          .to raise_error(Errors::File::NoSuchFile, "No such file #{data_folder_path}clauses.json")
      end
    end
  end
end
