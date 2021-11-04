class TrophiesController < ApplicationController
  before_action :tohsakabot_online

  def index
    return unless redirect_if_anonymous
    @trophies = Trophy.all

    respond_to do |format|
      format.html
      format.json { render json: @trophies }
    end
  end

  def show
    return unless redirect_if_anonymous
    @trophy = Trophy.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @trophy }
    end
  end
end
