class LocationsController < ApplicationController
  before_filter :ad_expire?
  before_filter :current_location
  before_filter :user_remembered?

  require 'will_paginate/array'

  def index

  end

  def show
    @location = Location.find_by_name(params[:id])
    session[:current_location] = @location.id
    redirect_to session[:current_url]
  end


end
