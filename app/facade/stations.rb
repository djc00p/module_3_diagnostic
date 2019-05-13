class StationFacade < ApplicationRecord

  def initialize(attribute)
    @access = attribute[:access_code]
    @fuel_type = attribute[:fuel_type_code]
    @zip = attribute[:zip]
  end

  def stations
    conn = Faraday.new("https://developer.nrel.gov/api/alt-fuel-stations/v1.json")
    conn.params['api_key'] = ENV['API_KEY']
    conn.adapter = conn.default_adapter

    response = conn.get("/#{@fuel_type}/#{@zip}/#{@access}")

    data = JSON.parse(response.body)
  end
end
