require 'simple_form'

class IssuesController < ApplicationController
  def index
    return unless redirect_if_anonymous
    @issues = Issue.all

    respond_to do |format|
      format.html
      format.json { render json: @issues }
    end
  end

  def show
    return unless redirect_if_anonymous
    @issue = Issue.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @issue }
    end
  end

  def new
    return unless redirect_if_anonymous
    @issue = Issue.new
  end

  def edit
    return unless redirect_if_anonymous
    return unless permission?(params[:id])

    @issue = Issue.find(params[:id])
  end

  def create
    return unless redirect_if_anonymous

    @issue = Issue.new(issue_params)
    @issue[:user_id] = get_user_id

    if @issue.save
      redirect_to @issue
    else
      render 'new'
    end
  end

  def update
    return unless redirect_if_anonymous
    return unless permission?(params[:id])

    @issue = Issue.find(params[:id])

    if @issue.update(issue_params)
      redirect_to @issue
    else
      render 'edit'
    end
  end

  def destroy
    return unless redirect_if_anonymous
    return unless permission?(params[:id])

    @issue = Issue.find(params[:id])
    @issue.destroy

    redirect_to issues_path
  end

  private

  def issue_params
    params.require(:issue).permit(:content, :category)
  end

  def permission?(issue_id)
    return true if allowed?(issue_id)

    redirect_to root_path
    false
  end

  def allowed?(issue_id)
    return Issue.find(issue_id)[:user_id] == session[:user_id]
  end

  def category(n)
    %w[Feature Bug][n]
  end

  def status_color(status)
    case status
    when 'done'
      '#00921B'
    when 'wontdo'
      '#BE0000'
    when 'indev'
      '#004A0E'
    else
      '#0070EE'
    end
  end

  helper_method :allowed?,
                :category,
                :status_color
end
