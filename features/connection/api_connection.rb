require 'net/http'
require 'uri'
require 'json'

class API

    def generate_cep_api(url)
        uri = URI(url)
        params = { :limit => 10, :page => 3 }
        uri.query = URI.encode_www_form(params)
        res = Net::HTTP.get_response(uri)
        return res.body
    end

    def cep_valido
        %w(04827170 02652110 05186225 02375000 03348005).sample
    end

    def cep_invalido
        %w(88001000 88908000 77908050 77448050 77228050).sample
    end
end