require_relative '../classes/books/addlabel'

RSpec.describe AddLabel do
  describe '#add_label' do
    let(:labels) { [] }
    let(:add_label_instance) { described_class.new }

    before do
      allow_any_instance_of(Object).to receive(:puts)
      allow(add_label_instance).to receive(:gets).and_return('Example Title', 'Blue')
      allow_any_instance_of(SaveData).to receive(:write_data)
    end

    it 'adds a label to the list' do
      add_label_instance.add_label(labels)
      expect(labels.length).to eq(1)
    end

    it 'creates a Label object with the provided data' do
      add_label_instance.add_label(labels)
      expect(labels.first).to be_a(Label)
      expect(labels.first.title).to eq('Example Title')
      expect(labels.first.color).to eq('Blue')
    end

    it 'calls write_data method with correct arguments' do
      expect_any_instance_of(SaveData).to receive(:write_data).with('labels.json', labels)
      add_label_instance.add_label(labels)
    end
  end
end
