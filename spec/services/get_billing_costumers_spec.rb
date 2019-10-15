require 'spec_helper'
require 'json'
require './app/services/get_billing_costumer_service'

describe 'Billing' do
  it 'get_billing' do
    contract = 35444
    res = GetBillingCostumerService.new(contract).perform
    expect(res.is_a? Array).to eql(true)
    expect(res[0] != nil).to eql(true)
    expect(res[1].is_a? Float).to eql(true)
  end
end