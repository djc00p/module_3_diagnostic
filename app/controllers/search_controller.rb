class SearchController < ApplicationController

  def index
    @stations = StationFacade.new()
  end

  private

  def station_params
    params.require(:stations).permit(:access_code, :fuel_type_code, :zip, :state, :access_days_time, :street_address, :station_name)
  end
end
