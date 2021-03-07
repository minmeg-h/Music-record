class MusicsController < ApplicationController
  require 'rspotify'
  RSpotify.authenticate(ENV['SPOTIFY_CLIENT_ID'], ENV['SPOTIFY_SECRET_ID'])

  def search
    if params[:search].present?
    @musics = RSpotify::Track.search(params[:search])
    artists = @musics.first.artists
    end
  end
end
