require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  # init data 
  describe 'POST /users' do
    # valid payload
    let(:valid_attributes) { { email: 'hello@gmail.com' ,password: 'aaa', password_confirmation: 'aaa'} }

    context 'when the request is valid' do
      before { post '/users', params: valid_attributes }

      it 'creates a users' do
        expect(json['email']=='hello@gmail.com')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

  
  end
end