class MusicsController < ApplicationController
  require 'rspotify'
  RSpotify.authenticate(ENV['SPOTIFY_CLIENT_ID'], ENV['SPOTIFY_SECRET_ID'])

  def search
    @musics = Music.all
     if params[:search].present?
     @musics = RSpotify::Artist.search(params[:search])
     end
   end
end
