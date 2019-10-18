require 'rest-client'
require 'json'

class GetBillingCostumerService
  def initialize(contrato)
    @contract = contrato
  end

  def perform 
    begin
      get_billing_costumer = Rails.application.credentials[Rails.env.to_sym][:get_billing_costumer_api]
      url = "#{get_billing_costumer}?contra=#{@contract}"
      
      res = RestClient.get url
      jsonParse = JSON.parse(res.body)
      
      success = jsonParse["success"]
      if success != 0
        numeroTitulo = jsonParse["0"][0]
        valorReal = jsonParse["0"][1]
        vencimento = jsonParse["0"][2]
        status_pagamento = jsonParse["0"][3]
        valor_correcao = '%.2f' % jsonParse["0"][4]

        boleto_maior_vencimento = [numeroTitulo,valor_correcao.to_f,vencimento,status_pagamento]
        boleto_maior_vencimento
      else
        success
      end

    rescue RestClient::ExceptionWithResponse => e
      e.response
    end
  end
end