class TrophiesController < ApplicationController
  before_action :tohsakabot_online

  def index
    return unless redirect_if_anonymous

    servers = channel_based_server_access(:default_channel)
    @trophies = Trophy.where(server_id: servers)

    respond_to do |format|
      format.html
      format.json { render json: @trophies }
    end
  end

  def show
    return unless redirect_if_anonymous

    @trophy = Trophy.find(params[:id])

    server = tohsaka_bridge.get_server_config(@trophy[:server_id])
    unless channel_permission?(@trophy[:server_id], server[:highlight_channel])
      redirect_to root_path
      return
    end

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
