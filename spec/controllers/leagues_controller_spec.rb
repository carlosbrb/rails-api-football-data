require 'rails_helper'
RSpec.describe LeaguesController do
  before(:each) do
    stub_all_requests
  end
  describe 'GET import' do
    it 'shows 404 status and "not found" message when league is not found' do
      get :import, params: { id: 'CLA' }
      expect(response.status).to eq(404)
      expect(response.body).to eq('{"message": "Not found"}')
    end

    it 'shows 504 status and "Server Error" message when league is not found' do
      stub_network_error
      get :import, params: { id: 'CLA' }
      expect(response.status).to eq(504)
      expect(response.body).to eq('{"message": "Server Error"}')
    end

    it 'shows 201 status and "success" message when league is not found' do
      get :import, params: { id: 'BSA' }
      expect(response.status).to eq(201)
      expect(response.body).to eq('{"message": "Successfully imported"}')
    end
  end

  describe 'GET total_players' do
    it 'shows the total_players for CL league' do
      get :import, params: { id: 'BSA' }
      get :total_players, params: { id: 'BSA' }
      expect(response.status).to eq(200)
      expect(response.body).to eq("{'total': 0}")
    end

    it 'shows 404 status and message if league isnt imported' do
      get :total_players, params: { id: 'CL' }
      expect(response.status).to eq(404)
    end

  end
end
