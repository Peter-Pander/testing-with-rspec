require 'rails_helper'

RSpec.describe Task, type: :model do
  let(:task) { Task.new(title: 'Sample Task Title', description: 'This is a sample task description used for testing purposes.') }

  describe '#initialize' do
    it 'is valid with all columns present' do
      expect(task.valid?).to eq(true)
    end

    context 'with missing title' do
      before do
        task.title = nil
      end

      it 'is not valid' do
        expect(task.valid?).to eq(false)
      end

      it 'returns error message' do
        task.valid?
        expect(task.errors.messages).to eq({ title: ["can't be blank"]})
      end
    end

    context 'with missing description' do
      before do
        task.description = nil
      end

      it 'is not valid' do
        expect(task.valid?).to eq(false)
      end

      it 'returns error message' do
        task.valid?
        expect(task.errors.messages).to eq({ description: ["can't be blank"]})
      end
    end
  end

  describe '#truncated_description' do
    context 'with long description' do
      it 'returns truncated description' do
        # "This is a sample task description used for testing purposes." truncated to first 11 characters, with an ellipsis appended, becomes "This is a s..."
        expect(task.truncated_description).to eq('This is a s...')
      end
    end

    context 'with short description' do
      before do
        task.description = 'Brief'
      end

      it 'returns full description' do
        expect(task.truncated_description).to eq('Brief')
      end
    end
  end
end




# spec/mvc_folder_name/class_spec.rb
# require 'rails_helper'

# RSpec.describe Class, type: :mvc_type do
#   describe '#method' do
#     it 'description of test' do
#       expect(value).to eq(expected_result)
#     end
#   end
# end
