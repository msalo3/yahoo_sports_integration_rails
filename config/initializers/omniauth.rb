Rails.application.config.middleware.use OmniAuth::Builder do
  provider :yahoo_oauth2, ENV['CLIENT_ID'], ENV['CLIENT_SECRET'],
    name: 'yahoo'
end