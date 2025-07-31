require 'net/http'
require 'open-uri'
require 'json'

class GetPrograms

  URL = "https://bronx.lehman.cuny.edu/resource/x9zi-ukip.json"

  def get_programs
    uri = URI.parse(URL)
    response = Net::HTTP.get_response(uri)
    response.body
  end

end

programs = GetPrograms.new.get_programs
puts programs
