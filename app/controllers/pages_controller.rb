class PagesController < ApplicationController
  def index
    # clean this up
    scores = HTTParty.get("http://espnfc.com/scores")

    doc = Nokogiri::HTML(scores)

    @groups = doc.css("#today-games .group-set")
    # binding.pry

  end
end
