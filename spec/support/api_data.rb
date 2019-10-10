RSpec.configure do |config|
  config.before(:each) do
    stub_request(:get, /192.168.80.5/)
    .with(headers:{
      'Accept'=>'*/*'
    }).to_return(status: 200, body: '
      {"informacoes":
        {
          "contrato":["13258"],
          "nome":["GISELI DE SOUZA DA SILVA "],
          "rua":["R JULIO BARCELOS "],
          "numero":["298"],
          "bairro":["JOCKEY CLUB"]
        },"success":1}',headers: {})
  end
end