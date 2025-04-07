# spec/controllers/tasks_controller_spec.rb

require 'rails_helper'
# Loads the Rails testing environment along with all necessary support files.

RSpec.describe TasksController, type: :controller do
  # We are testing the TasksController. The type: :controller
  # ensures that RSpec loads controller-specific helper methods.

  describe 'POST #create' do
    # This block describes tests for the POST #create action.
    # We want to test three main things:
    # 1. Method logic: What does the action do (flash messages, etc.)?
    # 2. Render/Redirect: Where does it redirect or render?
    # 3. Database persistence: Does it create (or skip) a Task?

    let(:description) { 'Description' }
    # Define a variable using RSpec's let helper.
    # This sets a default valid description for our tests.

    before do
      # Before each test in this block, simulate a POST request to the create action.
      post :create, params: { task: { title: 'Title', description: description } }
      # 'post :create' is one of the Rails controller test helpers. It calls the create endpoint.
      # The params hash mimics the form data being submitted.
    end

    context 'with correct params' do
      # Group tests when valid parameters are provided (i.e., title and description exist).

      it 'creates a Task' do
        # Database persistence: Check that a Task is actually saved in the database.
        expect(Task.find_by(title: 'Title').description).to eq('Description')
      end

      it 'redirects to task_path' do
        # Render/Redirect: Verify that after creating a Task, the controller redirects to its show page.
        expect(response).to redirect_to task_path(Task.last)
      end

      it 'renders a success notice' do
        # Method logic: Ensure that a success flash message is set.
        expect(flash[:notice]).to eq('Task was successfully created.')
      end
    end

    context 'with incorrect params' do
      # This context simulates submitting invalid data (missing description).
      let(:description) { nil }
      # Here, we override the default description to nil,
      # representing a case with missing required data.

      it 'skips Task creation' do
        # Database persistence: Expect that no Task is created.
        expect(Task.count).to eq(0)
      end

      it 'returns error status' do
        # Render/Redirect: Verify that the response returns an error status.
        # 422 Unprocessable Entity indicates that while the request was understood,
        # the input was invalid.
        expect(response.status).to eq(422)
      end
    end
  end
end
