require 'drb/drb'
require 'faraday'

class ApplicationController < ActionController::Base

  def api
    return unless redirect_if_anonymous

    render "/api"
  end

  def settings
    return unless redirect_if_anonymous

    @user = User.find(session[:user_id])
    @authorization = Authorization.find_by_user_id(session[:user_id])
    render "/settings"
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  def auth_header
    # { Authorization: 'Bearer <token>' }
    request.headers['Authorization']
  end

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
    return '/tohsakaweb_default_avatar.png' if discord_id.nil? || avatar_hash.nil?

    base_url = "https://cdn.discordapp.com/avatars/#{discord_id}/#{avatar_hash}."

    return base_url + "gif" if avatar_hash[0..1] == 'a_'
    return base_url + "png" if Faraday.head(base_url + "png").status == 200
    return base_url + "jpg" if Faraday.head(base_url + "jpg").status == 200

    '/tohsakaweb_default_avatar.png'
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

  def is_owner?
    Rails.configuration.owner_id == get_discord_id.to_i
  end

  def permissions?(level)
    session[:permissions].to_i >= level.to_i
  end

  def decoded_token
    if auth_header
      token = auth_header.split(' ')[1]
      begin
        data = JWT.decode(token, Rails.application.credentials.dig(:jwt_secret), true, algorithm: 'HS256')
        authorization = Authorization.find_by_user_id(data[0]["user_id"])

        session[:user_id] = authorization.user_id
        session[:uid] = authorization.uid
        session[:name] = authorization.user.name
        session[:discriminator] = authorization.user.discriminator
        session[:avatar] = authorization.user.avatar
        session[:locale] = authorization.user.locale
        session[:permissions] = authorization.user.permissions

        data
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def logged_in?
    decoded = decoded_token
    if decoded
      @current_user ||= User.find(decoded[0]['user_id'].to_i)
    elsif session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      false
    end
  end

  def api?
    request.path[0..3] == '/api'
  end

  def redirect_if_anonymous
    unless logged_in?
      if api?
        render json: { message: 'Unauthorized' }, status: :unauthorized
      else
        redirect_to root_path
      end
      return false
    end
    true
  end

  def encode_token(payload)
    JWT.encode(payload, Rails.application.credentials.dig(:jwt_secret), 'HS256')
  end

  helper_method :api?,
                :tohsaka_bridge,
                :tohsakabot_online,
                :avatar_url,
                :get_name,
                :get_discriminator,
                :get_avatar_hash,
                :get_discord_id,
                :get_user_id,
                :get_locale,
                :logged_in?,
                :permissions?,
                :is_owner?,
                :redirect_if_anonymous,
                :encode_token
end
