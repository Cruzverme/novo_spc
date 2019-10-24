require 'rest-client'
require 'json'

class CheckPaymentBillingService
  def initialize(contract, title)
    @contract = contract
    @title = title
  end

  def perform
    begin
      check_payment = Rails.application.credentials[Rails.env.to_sym][:check_billing_api]
      url = "#{check_payment}?contra=#{@contract}&titulo=#{@title}"

      res = RestClient.get url
      json_parse = JSON.parse(res.body)

      success = json_parse['success']

      @costumer = Costumer.find_by_contract_number(@contract)
      @title_number = @costumer.billings.find_by_number_titulo(@title)
      if success != 0
        @title_number.status_pago = json_parse['0'][0]
        @title_number.status_billing = true
        @title_number.save
      end
      @title_number.status_pago
    rescue RestClient::ExceptionWithResponse => e
      e.response
    end
  end
end