Rails.application.config.middleware.use OmniAuth::Builder do
  provider :yahoo_auth, ENV['YAHOO_CLIENT_ID'], ENV['YAHOO_APP_SECRET']
end