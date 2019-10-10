require 'rest-client'
require 'json'

class GetClientesErpService
  def initialize(contrato)
    @contract = contrato 
  end

  def perform
    begin
      get_costumer_information = Rails.application.credentials[Rails.env.to_sym][:get_costumer_info_api_url]
      url = "#{get_costumer_information}?contra=#{@contract}"
      #url = "http://192.168.80.5/sisspc/demos/get_informacoes_contrato.php?contra=#{@contract}"
      res = RestClient.get url
      jsonParse = JSON.parse(res.body)
      
      name = jsonParse["informacoes"]["nome"][0]
      street = jsonParse["informacoes"]["rua"][0]
      st_number = jsonParse["informacoes"]["numero"][0]
      neighborhood = jsonParse["informacoes"]["bairro"][0]
      success = jsonParse["success"]
      
      informacoesAssinante = [name,street,st_number,neighborhood]
      ### SE RETORNO FOR 1 ELE FOI UM SUCESSO
      informacoesAssinante
    rescue RestClient::ExceptionWithResponse => e
      e.response
    end
    
  end

end