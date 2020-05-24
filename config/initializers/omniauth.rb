require 'omniauth-discord'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :discord,
           ENV['DISCORD_CLIENT_ID'],
           ENV['DISCORD_CLIENT_SECRET'],
           scope: 'identify',
           callback_url: 'http://localhost:3000/auth/discord/callback'
end

# Force redirection when failed OAuth. https://stackoverflow.com/a/11028187
class SafeFailureEndpoint < OmniAuth::FailureEndpoint
  def call
    redirect_to_failure
  end
end

OmniAuth.config.on_failure = SafeFailureEndpoint
