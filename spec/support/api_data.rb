Rspec.configure do |config|
  config.before(:each) do
    stub_request(:get, /192.168.80.5/)
    .with(headers:{
      'Accept'=>'*/*'
    }).to_return(status: 200, body: '
      {
        "velocidade":["329"],
        "nome":["GISELI DE SOUZA DA SILVA"],
        "success":1
      }',headers: {})
  end
end