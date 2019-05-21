require 'open-uri'
require 'json'

class FlatsController < ApplicationController
  def index
    @flats = search_flats
  end

  def show
    @flats = search_flats
    @id = params[:id]
    @flat = @flats.find do |flat|
      flat['id'].to_s == @id
    end
  end

  def search_flats
    url = "https://raw.githubusercontent.com/lewagon/flats-boilerplate/master/flats.json"
    JSON.parse(open(url).read)
  end
end
