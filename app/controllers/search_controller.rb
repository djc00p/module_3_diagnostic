class SearchController < ApplicationController

  def index
    @stations = StationFacade.new
  end
end
