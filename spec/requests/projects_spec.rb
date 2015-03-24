require 'rails_helper'

RSpec.describe 'Projects API' do
  let(:default_params) { { format: :json } }

  let(:question) { 'Why did the chicken cross the road?' }
  let(:answer) { 'To get to the other side.' }
  let(:project_name) { 'To get to the other side.' }
  let(:question_model) { create :project_question, question: question, load_order: 0 }

  describe 'GET index' do
    before :each do
      @project = create :project
      @project2 = create :project
      sign_in_as create :staff, :admin
    end

    it 'returns a collection of all projects', :show_in_doc  do
      create :project_detail, project_id: @project.id
      create :project_detail, project_id: @project2.id
      staff = create :staff
      create :staff_project, staff_id: staff.id, project_id: @project.id
      get '/api/v1/projects'
      expect(json.length).to eq(2)
    end

    it 'paginates the projects' do
      get '/api/v1/projects', page: 1, per_page: 1
      expect(json.length).to eq(1)
    end
  end

  describe 'GET show' do
    before :each  do
      @project = create :project
      sign_in_as create :staff, :admin
    end

    it 'retrieves project by id' do
      get "/api/v1/projects/#{@project.id}"
      expect(json['name']).to eq(@project.name)
    end

    it 'returns an error when the project does not exist' do
      get "/api/v1/projects/#{@project.id + 999}"
      expect(response.status).to eq(404)
      expect(json).to eq('error' => 'Not found.')
    end
  end

  describe 'POST create' do
    before :each do
      sign_in_as create :staff, :admin
    end

    it 'creates a new project record' do
      project_data = attributes_for(:project)
      post '/api/v1/projects', project_data
      expect(json['name']).to eq(project_data[:name])
    end

    it 'creates a new project record w/ project answers', :show_in_doc do
      project_data = attributes_for(:project, project_answers: [{ project_question_id: question_model.id, answer: answer }])
      post '/api/v1/projects', project_data.merge(includes: %w(project_answers))
      expect(json['project_answers'][0]['id']).to eq(ProjectAnswer.first.id)
    end
  end

  describe 'PUT update' do
    before :each do
      @project = create :project
      sign_in_as create :staff, :admin
    end

    it 'changes existing project' do
      put "/api/v1/projects/#{@project.id}", name: 'Updated', budget: 1.99
      expect(response.status).to eq(204)
    end

    it 'updates a project record w/ project answers', :show_in_doc do
      project_data = attributes_for(:project, project_answers: [{ project_question_id: question_model.id, answer: answer }])
      put "/api/v1/projects/#{@project.id}", project_data
      @project.reload
      expect(@project.project_answers.length).to eq(1)
    end

    it 'returns an error when the project does not exist' do
      put "/api/v1/projects/#{@project.id + 999}", attributes_for(:project)
      expect(response.status).to eq(404)
      expect(json).to eq('error' => 'Not found.')
    end
  end
end
