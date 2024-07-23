require 'net/http'
require 'open-uri'
require 'json'
 
class GetCoins
  URL = "https://api.coincap.io/v2/assets"

  def get_coins
    uri = URI.parse(URL)
    response = Net::HTTP.get_response(uri)
    response.body
  end

  def print_coins
    coins = JSON.parse(self.get_coins)
    coins["data"].map { |coin| coin["name"] }
  end
end

coins = GetCoins.new.make_coins
puts coins
