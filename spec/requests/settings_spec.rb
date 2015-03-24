require 'rails_helper'

RSpec.describe 'Setting API' do
  let(:default_params) { { format: :json } }

  describe 'GET index' do
    before(:each) do
      setting = create :setting
      setting.setting_fields << create(:setting_field)
      sign_in_as create :staff, :admin
      @settings = Setting.all
    end

    it 'returns a collection of all of the settings' do
      get '/api/v1/settings'
      expect(json.length).to eq(1)
      expect(json[0]['setting_fields'].length).to eq(1)
    end

    it 'paginates the settings' do
      get '/api/v1/settings', page: 1, per_page: 1
      expect(json.length).to eq(1)
    end
  end

  describe 'GET show' do
    before(:each) do
      @setting = create :setting, name: 'test'
      sign_in_as create :staff, :admin
    end

    it 'returns an settings; lookup done by hid', :show_in_doc do
      get "/api/v1/settings/#{@setting.hid}"
      expect(response.body).to eq(@setting.to_json(include: %w(setting_fields)))
    end

    it 'returns an error when the setting does not exist' do
      get '/api/v1/settings/bad_hid'
      expect(response.status).to eq(404)
      expect(json).to eq('error' => 'Not found.')
    end
  end

  describe 'PUT update' do
    before(:each) do
      @setting = create :setting
      @setting.setting_fields.create(value: 'old', hid: 'testhid')
      sign_in_as create :staff, :admin
    end

    it 'updates a setting', :show_in_doc do
      put "/api/v1/settings/#{@setting.id}", setting_fields: [{ id: @setting.setting_fields.first.id, value: 'new' }]
      expect(SettingField.first.value).to eq('new')
    end

    it 'returns an error when the setting does not exist' do
      put "/api/v1/settings/#{@setting.id + 999}"
      expect(response.status).to eq(404)
      expect(json).to eq('error' => 'Not found.')
    end
  end

  describe 'DELETE destroy' do
    before :each do
      @setting = create :setting
      sign_in_as create :staff, :admin
    end

    it 'verifies a setting no longer exists after delete', :show_in_doc do
      delete "/api/v1/settings/#{@setting.id}"
      expect(response.status).to eq(204)
    end
  end
end
