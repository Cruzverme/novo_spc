RSpec.configure do |config|
  config.before(:each) do
    stub_request(:get, /get_informacoes_contrato.php/) #get costumer informations
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
        },"success":1}', headers: {})

    stub_request(:get, /get_billing_costumers.php/) # get billings
    .with(headers:{
      'Accept'=>'*/*'
    }).to_return(status: 200, body: '
      {"0":["6804210317","102.72","15-APR-17","N",136.02230906666665]
        ,"success":1}', headers: {})

    stub_request(:get, /check_billing.php/) # check payment
    .with(headers:{
      'Accept'=>'*/*'
    }).to_return(status: 200, body: '
      {"0":["S","10-OCT-19"],"success":1}', headers: {})
  end
end