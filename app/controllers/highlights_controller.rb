class HighlightsController < ApplicationController
  before_action :tohsakabot_online

  def index
    return unless redirect_if_anonymous
    @highlights = Highlight.all
  end

  def show
    return unless redirect_if_anonymous
    @highlight = Highlight.find(params[:id])
  end
end
