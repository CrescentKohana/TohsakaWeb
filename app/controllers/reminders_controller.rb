require 'simple_form'

class RemindersController < ApplicationController
  def index
    return unless redirect_if_anonymous
    @reminders = Reminder.where(:user_id => get_user_id)
  end

  def show
    return unless redirect_if_anonymous
    return unless permission?(params[:id])
    @reminder = Reminder.find(params[:id])
  end

  def new
    return unless redirect_if_anonymous
    @reminder = Reminder.new
  end

  def edit
    return unless redirect_if_anonymous
    return unless permission?(params[:id])
    @reminder = Reminder.find(params[:id])
  end

  def create
    return unless redirect_if_anonymous

    @reminder = Reminder.new(reminder_params)
    @reminder[:user_id] = get_user_id

    if @reminder.save
      redirect_to @reminder
    else
      render 'new'
    end
  end

  def update
    return unless redirect_if_anonymous
    return unless permission?(params[:id])
    @reminder = Reminder.find(params[:id])

    if @reminder.update(reminder_params)
      redirect_to @reminder
    else
      render 'edit'
    end
  end


  def destroy
    return unless redirect_if_anonymous
    return unless permission?(params[:id])
    @reminder = Reminder.find(params[:id])
    @reminder.destroy

    redirect_to reminders_path
  end

  private
  def reminder_params
    params.require(:reminder).permit(:datetime, :message, :channel, :repeat)
  end

  def permission?(reminder_id)
    return true if Reminder.find(reminder_id)[:user_id] == session[:user_id]
    redirect_to root_path
    false
  end

  def choosable_channels(discord_uid)
    return nil if discord_uid.nil?
    possible_channels = Hash.new
    tohsaka_bridge.channels_user_has_rights_to(discord_uid).each do |c|
      possible_channels[c.id] = c.name
    end

    possible_channels
  end

  helper_method :choosable_channels
end
