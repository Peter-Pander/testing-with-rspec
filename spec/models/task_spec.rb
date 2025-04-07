require 'rails_helper'
# Loads the Rails testing environment and support files.

RSpec.describe Task, type: :model do
  # We are testing the Task model. `type: :model` tells RSpec to treat this as a model spec.

  let(:task) do
    # Create a sample Task instance using Task.new but don't save it to the database yet.
    # This will be used across multiple tests.
    Task.new(
      title: 'Sample Task Title',
      description: 'This is a sample task description used for testing purposes.'
    )
  end

  describe '#initialize' do
    # This group of tests checks the validity of a Task when it's first created (initialized).

    it 'is valid with all columns present' do
      # A task with both title and description should pass validation.
      expect(task.valid?).to eq(true)
    end

    context 'with missing title' do
      # Tests the case where the title is missing.

      before do
        task.title = nil
      end

      it 'is not valid' do
        # A task without a title should fail validation.
        expect(task.valid?).to eq(false)
      end

      it 'returns error message' do
        # Run validation to populate the `errors` hash.
        task.valid?
        # Check that the right error message appears for the title field.
        expect(task.errors.messages).to eq({ title: ["can't be blank"] })
      end
    end

    context 'with missing description' do
      # Tests the case where the description is missing.

      before do
        task.description = nil
      end

      it 'is not valid' do
        # A task without a description should fail validation.
        expect(task.valid?).to eq(false)
      end

      it 'returns error message' do
        # Run validation to populate the `errors` hash.
        task.valid?
        # Check that the right error message appears for the description field.
        expect(task.errors.messages).to eq({ description: ["can't be blank"] })
      end
    end
  end

  describe '#truncated_description' do
    # This group of tests checks the behavior of the custom `#truncated_description` method.
    # This method shortens long descriptions and adds "..." to the end.

    context 'with long description' do
      it 'returns truncated description' do
        # "This is a sample task description used for testing purposes."
        # truncated to first 11 characters, with an ellipsis appended,
        # becomes "This is a s..."
        expect(task.truncated_description).to eq('This is a s...')
      end
    end

    context 'with short description' do
      # This test case checks what happens when the description is already short.

      before do
        task.description = 'Brief'
      end

      it 'returns full description' do
        # Since the description is shorter than or equal to 10 characters,
        # it should be returned unchanged.
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
