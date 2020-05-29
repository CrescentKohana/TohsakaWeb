require 'drb/drb'
require 'faraday'

class ApplicationController < ActionController::Base
  private
  def tohsaka_bridge
    connection = DRbObject.new_with_uri(SERVER_URI)
    connection if connection.online?
  rescue
    :offline
  end

  def tohsakabot_online(home = false)
    if tohsaka_bridge == :offline
      redirect_to root_path unless home
      return false
    end
    true
  end

  def avatar_url(discord_id, avatar_hash)
    return '/assets/tohsakaweb_default_avatar.png' if discord_id.nil? || avatar_hash.nil?

    base_url = "https://cdn.discordapp.com/avatars/#{discord_id}/#{avatar_hash}."

    return base_url + "gif" if avatar_hash[0..1] == 'a_'
    return base_url + "png" if Faraday.head(base_url + "png").status == 200
    return base_url + "jpg" if Faraday.head(base_url + "jpg").status == 200

    '/assets/tohsakaweb_default_avatar.png'
  end

  def get_name
    User.find_by(id: session[:user_id]).name
  end

  def get_discriminator
    User.find_by(id: session[:user_id]).discriminator
  end

  def get_discord_id
    session[:uid]
  end

  def get_user_id
    session[:user_id]
  end

  def get_avatar_hash
    User.find_by(id: session[:user_id]).avatar
  end

  def get_locale
    User.find_by(id: session[:user_id]).locale
  end

  def logged_in?
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def redirect_if_anonymous
    unless logged_in?
      redirect_to root_path
      return false
    end
    true
  end

  helper_method :tohsaka_bridge,
                :tohsakabot_online,
                :avatar_url,
                :get_name,
                :get_discriminator,
                :get_avatar_hash,
                :get_discord_id,
                :get_user_id,
                :get_locale,
                :logged_in?,
                :redirect_if_anonymous
end
