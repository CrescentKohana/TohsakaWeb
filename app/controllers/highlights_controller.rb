class HighlightsController < ApplicationController
  before_action :tohsakabot_online

  def index
    return unless redirect_if_anonymous
    @highlights = Highlight.all

    respond_to do |format|
      format.html
      format.json { render json: @highlights }
    end
  end

  def show
    return unless redirect_if_anonymous
    @highlight = Highlight.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @highlight }
    end
  end

  private
  def attachments_as_array(attachments)
    attachments.split
  end

  def attachment_preview(attachment)
    if %w[.jpg .png .jpeg .JPG .PNG .JPEG .gif].include?(File.extname(attachment))
      html = %{<img src="#{attachment}" alt="image attachment" width=400>}
    elsif %w[.mp4 .webm .mov].include?(File.extname(attachment))
      html = '<video controls width="400">'\
             "<source src=\"#{attachment}\" type=\"video/#{File.extname(attachment)[1..]}\">"\
             'Sorry, your browser does not support embedded videos.'\
             '</video>'
    elsif  %w[.wav .flac .ogg .mp3].include?(File.extname(attachment))
      html = "<audio controls src=\"#{attachment}\">"\
             'Your browser does not support the audio element.'\
             '</audio>'
    else
      html = "<p>Attachment cannot be previewed.</p>"
    end

    html.html_safe
  end

  helper_method :attachments_as_array, :attachment_preview
end
