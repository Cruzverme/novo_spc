require 'rails_helper'
require 'shared_contexts'

RSpec.describe "Costumers Fill Input Fields", :type => :system, js: true do
  include_context "api request authentication helper methods"
  include_context "api request global before and after hooks"
  
  let(:email) { 'joe@gmail.com' }
  let(:password) { '123456' }

  let!(:user) { create(:user) }

  it 'fill costumers informations' do
    sign_in(user)
    
    contract = 13258
    res = GetClientesErpService.new(contract).perform
    visit '/costumers/new'
    within("#costumer_form") do
      fill_in 'contract', with: contract
      fill_in 'name', with: res[0]
      fill_in 'street', with: res[1]
      fill_in 'street_no', with: res[2]
      fill_in 'neighborhood', with: res[3]

    end

    click_button 'Avançar'

    #save_and_open_page
    expect(page).to have_content("informacoes")
  end
end