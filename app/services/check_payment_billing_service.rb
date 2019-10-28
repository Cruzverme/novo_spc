# frozen_string_literal: true

require 'rest-client'
require 'json'

class CheckPaymentBillingService
  def initialize
    @costumers = Costumer.all
  end

  def perform
    check_payment = Rails.application.credentials[Rails.env.to_sym][:check_billing_api]

    @costumers.each do |costumer|
      next unless costumer.billings.exists?

      url = "#{check_payment}?contra=#{costumer.contract_number}&titulo=#{costumer.billings.last.number_titulo}"
      res = RestClient.get url
      json_parse = JSON.parse(res.body)

      success = json_parse['success']
      @title_number = costumer.billings.find_by_number_titulo(costumer.billings.last.number_titulo)

      if success != 0
        costumer.status_spc = false
        @title_number.status_pago = json_parse['0'][0]
        @title_number.status_billing = true
      elsif success != 1
        costumer.status_spc = true
        if @title_number.status_pago != json_parse['0'][0]
          @title_number.status_pago = json_parse['0'][0]
        @title_number.status_billing = false
      end
      @title_number.save
      costumer.save
    end

    @title_number.status_pago
  rescue RestClient::ExceptionWithResponse => e
    e.response
  end
end
