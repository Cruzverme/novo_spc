require 'spec_helper'
require 'json'
require './app/services/get_clientes_erp_service'

describe 'Informations' do
  it 'get_information' do
    contract = 13258
    res = GetClientesErpService.new(contract).perform
    expect(res.is_a? Array).to eql(true)
    expect(res[0] != nil).to eql(true)
    expect(res[0].is_a? String).to eql(true)
    expect(res.size == 4).to eql(true)
    expect(res != nil).to eql(true)
  end
end