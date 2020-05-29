#language: pt

Funcionalidade: Teste de API consultar os dados de um endereço a partir de um CEP.

@cep_valido
Cenario: Fazer um Post no viacep com um CEP válido.
Quando eu faço um post com um CEP válido
Então o resultado é um JSON com os dados do CEP

@cep_invalido
Cenario: Fazer um Post no viacep com um CEP inválido.
Quando eu faço um post com um CEP inválido
Então o resultado é um JSON com erro igual a true