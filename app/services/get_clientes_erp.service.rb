require 'rest-client'
require 'json'

class GetClientesErpService

  def initialize(contrato)
    @contract = contrato 
  end

  def perform
    begin
      url = "http://192.168.80.5/sisspc/demos/get_pacote_ftth_cplus.php?contra=#{@contract}"
      res = RestClient.get url
      jsonParse = JSON.parse(res.body)
      name = jsonParse["name"]
      puts name 
    rescue RestClient::ExceptionWithResponse => e
      e.response
    end
    
  end

end