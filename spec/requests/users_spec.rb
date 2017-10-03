require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  # init data 
  let!(:users) { create_list(:user, 10) }

 
  describe 'GET /users' do
    # make HTTP get request 
    before { get '/users' }

    it 'returns users' do
      #  `json` is a custom helper to parse JSON
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end


  describe 'POST /users' do
    # valid payload
    let(:valid_attributes) { { username: 'anshor', email:'abc', created_by: '1' } }

    context 'when the request is valid' do
      before { post '/users', params: valid_attributes }

      it 'creates a user' do
        expect(json['username']).to eq('anshor')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/users', params: {username: 'anshor', email:'abc' }}

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Created by can't be blank/)
      end
    end
  end
end