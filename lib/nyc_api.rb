require 'net/http'
require 'open-uri'
require 'json'

class GetPrograms
  URL = 'https://bronx.lehman.cuny.edu/resource/x9zi-ukip.json'

  def get_programs
    uri = URI.parse(URL)
    response = Net::HTTP.get_response(uri)
    response.body
  end

  def program_school
    # we use the JSON library to parse the API response into nicely formatted JSON
    programs = JSON.parse(get_programs)
    programs.collect do |program|
      program['agency']
    end
  end
end

# programs = GetPrograms.new.get_programs
# puts programs

programs = GetPrograms.new
puts programs.program_school.uniq
