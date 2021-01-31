class HomesController < ApplicationController
  before_action :authenticate_user!
  require 'rspotify'
  RSpotify.authenticate(ENV['SPOTIFY_CLIENT_ID'], ENV['SPOTIFY_SECRET_ID'])

  def index; end

  def search
    if params[:search].present?
    @searchartists = RSpotify::Artist.search(params[:search])
   end
end
