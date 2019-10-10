require 'rest-client'
require 'json'

class GetClientesErpService
  def initialize(contrato)
    @contract = contrato 
  end

  def perform
    begin
      #get_costumer_information = Rails.application.credentials[Rails.env.to_sym][:get_costumer_info_api_url]
      #url = "#{get_costumer_information}?contra=#{@contract}"
      url = "http://192.168.80.5/sisspc/demos/get_pacote_ftth_cplus.php?contra=#{@contract}"
      res = RestClient.get url
      jsonParse = JSON.parse(res.body)
      name = jsonParse["nome"]
      success = jsonParse["success"]
      
      name[0]
    rescue RestClient::ExceptionWithResponse => e
      e.response
    end
    
  end

end