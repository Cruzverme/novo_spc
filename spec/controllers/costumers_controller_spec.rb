require 'rails_helper'
require 'shared_contexts'

RSpec.describe CostumersController, type: :controller do
  include Devise::Test::ControllerHelpers
  
  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @current_user = FactoryBot.create(:user)
    sign_in @current_user
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create" do
    it "create a Costumer" do
      contract = "35444"
      costumer_attributes = GetClientesErpService.new(contract).perform
      post :create, params: {
                              name: costumer_attributes[0],
                              street:costumer_attributes[1],
                              streetNo: costumer_attributes[2],
                              contract_number: contract,
                              status_spc: true
                            }
      expect(Costumer.last.contract_number).to eql(contract)
    end
  end

end
