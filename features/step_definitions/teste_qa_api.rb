api     = API.new
cep     = CEP.new

Quando("eu faço um post com um CEP válido") do
    $cep = cep.cep_valido                              
    $json_cep_valido = JSON.parse(api.generate_cep_api('https://viacep.com.br/ws/' + $cep + '/json/'))
    p 'Código do IBGE: ' + $json_cep_valido["ibge"]
end                                                                          
                                                                               
Então("o resultado é um JSON com os dados do CEP") do                        
    expect($json_cep_valido["cep"].gsub!(/[^0-9A-Za-z]/, '')).to eq $cep 
end                                                                          
                                                                               
Quando("eu faço um post com um CEP inválido") do   
    $cep = cep.cep_invalido                         
    $cep_invalido = api.generate_cep_api('https://viacep.com.br/ws/' + $cep + '/json/')
end                                                                          
                                                                               
Então("o resultado é um JSON com erro igual a true") do                      
    json_cep_invalido = JSON.parse($cep_invalido)
    expect(json_cep_invalido["erro"]).to eq true 
end