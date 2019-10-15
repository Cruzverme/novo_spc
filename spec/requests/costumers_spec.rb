require 'rails_helper'
require 'shared_contexts'

RSpec.describe 'Costumers', type: :request do
  include_context "api request authentication helper methods"
  include_context "api request global before and after hooks"

  let(:email) { 'joe@gmail.com' }
  let(:password) { '123456' }

  let!(:user) { create(:user, email: email, password: password) }
  
  before(:each) do 
    sign_in(user)
  end

  describe 'GET #index' do
    it 'returns http success' do
      get '/costumers'
      expect(response).to have_http_status(200)
    end
  end
  
  describe 'GET #costumerInformations' do
    it 'return http success' do
      get '/costumer_informations', params:{
        contract: "13258"
      }

      expect(response).to have_http_status(200)
    end
  end


end
