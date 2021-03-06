require 'oauth2'

class Credentials::OAuthController < ActionController::Base
  before_action :get_oauth_client
  before_action :set_connection

  def authorize
    redirect_to @client.auth_code.authorize_url + "&state=#{@connection.id}"
  end

  def callback
    code = params[:code]
    token = @client.auth_code.get_token(code).to_hash
    redirect_to edit_connection_path(@connection, token)
  end

  private

  def set_connection
    @connection = Connection.find(params[:connection_id])
  end

  def get_oauth_client
    params[:connection_id] ||= params[:state] || session[:oauth_connection_id]

    @connection = Connection.find(params[:connection_id])

    oauth_config = { site: ENV["REQUEST_URL"], redirect_uri: credentials_oauth_callback_url }
    oauth_config[:token_url] = 'https://api.login.yahoo.com/oauth2/get_token'
    oauth_config[:authorize_url] = ENV["REQUEST_URL"]

    @client = OAuth2::Client.new(ENV["CLIENT_ID"], ENV["CLIENT_SECRET"], oauth_config)
  end
end
