require 'rest-client'

class DataRequest::DataRequestController < ActionController::Base
  before_action :set_connection

  def league_info
    begin
      # Config object should contain the normal params as well as:
      #     "league_id": "9001",
      #     "sport": "nhl"
      url = 'https://fantasysports.yahooapis.com/fantasy/v2/league/nhl.l.9001?format=json'
      data = RestClient.get url, {:Authorization => "Bearer #{@connection.access_token}"
      response = JSON.parse(data)

      league_obj = Yahoo::League.new(league_info['fantasy_content']['league'].first).as_hash

    rescue => e
      puts e.backtrace
    end
  end

  private

  def set_connection
    @connection = current_connection
  end

  def set_credentials
    @url = "https://fantasysports.yahooapis.com/fantasy/v2/"
    @access_token = access_token
    @refresh_token = refresh_token
  end
end
