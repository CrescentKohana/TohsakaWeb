require 'simple_form'

class TriggersController < ApplicationController

  def index
    return unless redirect_if_anonymous
    @triggers = Trigger.where(:user_id => get_user_id)
  end

  def show
    return unless redirect_if_anonymous
    return unless permission?(params[:id])
    @trigger = Trigger.find(params[:id])
  end

  def new
    return unless redirect_if_anonymous
    @trigger = Trigger.new
  end

  def edit
    redirect_to root_path
    return #unless redirect_if_anonymous
    return unless permission?(params[:id])
    @trigger = Trigger.find(params[:id])
  end

  def create
    return unless redirect_if_anonymous
    @trigger = Trigger.new(trigger_params)
    @trigger.user_id = get_user_id
    @trigger.chance = 0

    if @trigger.save!
      # Pass the file to TohsakaBot
      tohsaka_bridge.save_trigger_file(@trigger.file.current_path, @trigger.file.filename)
      redirect_to @trigger
    else
      render 'new'
    end
  end

  def update
    redirect_to root_path
    return #unless redirect_if_anonymous
    return unless permission?(params[:id])
    @trigger = Trigger.find(params[:id])

    if @trigger.update(trigger_params)
      redirect_to @trigger
    else
      render 'edit'
    end
  end

  def destroy
    return unless redirect_if_anonymous
    return unless permission?(params[:id])
    @trigger = Trigger.find(params[:id])
    @trigger.destroy

    redirect_to triggers_path
  end

  private
  def trigger_params
    params.require(:trigger).permit(:phrase, :reply, :server_id, :mode, :file)
  end

  def upload_file(file)
    unless file.nil?
      # Returns the new name while moving it to triggers folder inside TohsakaBot
      tohsaka_bridge.save_trigger_file(file)
    end
  end

  def permission?(trigger_id)
    return true if Trigger.find(trigger_id)[:user_id] == session[:user_id]
    redirect_to root_path
    false
  end

  def choosable_servers(discord_uid)
    return nil if discord_uid.nil?
    possible_servers = Hash.new
    tohsaka_bridge.servers_user_is_in(discord_uid).each do |c|
      possible_servers[c.id] = c.name
    end

    possible_servers
  end

  helper_method :choosable_servers
end
