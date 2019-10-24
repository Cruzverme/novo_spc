# frozen_string_literal: true

require 'spec_helper'
require 'json'
require './app/services/check_payment_billing_service'

describe 'Check Payment' do
  it 'billing paid' do
    contract = 35_444
    title = 6_804_210_317

    res = CheckPaymentBillingService.new(contract, title).perform
    expect(res.is_a?(String)).to eql(true)
    expect(res[0] == 'S').to eql(true)
  end

  # it 'billing not paid' do
  #   contract = 35444
  #   title = 6804210317

  #   res = CheckPaymentBillingService.new(contract, title).perform
  #   expect(res.is_a? String).to eql(true)
  #   expect(res[0] == 'N').to eql(true)
  # end
end
