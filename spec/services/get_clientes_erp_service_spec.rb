require 'spec_helper'
require 'json'
require './app/services/get_clientes_erp_service'

describe 'Informations' do
  it 'get_information' do
    contract = 13258
    res = GetClientesErpService.new(contract).perform
    expect(res).to eql("GISELI DE SOUZA DA SILVA ")
    expect(res != nil).to eql(true)
  end
end