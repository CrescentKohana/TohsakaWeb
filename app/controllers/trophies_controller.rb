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

  private

  def category(n)
    { role: %w[Unknown Winner Fool][n], color: %w[#000 #00921B #BE0000][n] }
  end

  helper_method :category
end
