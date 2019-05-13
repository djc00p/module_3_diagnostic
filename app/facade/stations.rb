class StationFacade < ApplicationRecord

  def initialize(station_name, access_code, fuel_type)
    @station_name = station_name
    @access = access
    @fuel_type = fuel_type
    @zip = zip
    @station_name = station_name
  end

  def stations
    conn = Faraday.new("https://developer.nrel.gov/api/alt-fuel-stations/v1.json")
    conn.params['api_key'] = 'KRiS0d4fdjT4bhU0Sy1LYV6ne1w1oC47fgkfnvwy'
    conn.adapter = conn.default_adapter

    response = conn.get("/#{@fuel_type}/#{@zip}/#{@access}")
  end
end
