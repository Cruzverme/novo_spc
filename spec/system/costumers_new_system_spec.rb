require 'rails_helper'

RSpec.describe "Costumers Fill Input Fields", :type => :system, js: true do
  it 'fill costumers informations' do
    contract = 13258
    res = GetClientesErpService.new(contract).perform
    visit '/costumer/new'
    within("#costumer_form") do
      fill_in 'contract', with: contract
    end

    click_button 'Avançar'

    #save_and_open_page
    expect(page).to have_content('name')
    expect(page).to have_content('street')
    expect(page).to have_content('street_no')
    expect(page).to have_content('neighborhood')
  end
end