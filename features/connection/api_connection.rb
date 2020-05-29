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
    
end