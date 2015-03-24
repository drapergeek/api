require 'rails_helper'

RSpec.describe 'Sessions API' do
  let(:default_params) { { format: :json } }
  let(:password) { 'test1234' }
  let(:email) { 'foo@bar.com' }

  describe 'POST create' do
    before :each do
      @staff_member = create :staff, :admin, email: email, password: password, password_confirmation: password
    end

    it 'creates a session for valid users', :show_in_doc do
      post '/api/v1/staff/sign_in.json', staff: { email: email, password: password }
      expect(response.code).to eq('200')
    end

    it 'does not create a session for invalid users', :show_in_doc do
      post '/api/v1/staff/sign_in.json', staff: { email: email, password: 'invalidpassword' }
      expect(response.code).to eq('401')
    end
  end

  describe 'DELETE destroy' do
    before :each do
      @staff_member = create :staff, :admin, email: email, password: password, password_confirmation: password
      post '/api/v1/staff/sign_in.json', staff: { email: email, password: 'invalidpassword' }
    end

    it 'does not create a session for invalid users', :show_in_doc do
      delete '/api/v1/staff/sign_out.json'
      expect(json).to eq({})
      expect(response.code).to eq('200')
    end
  end
end
