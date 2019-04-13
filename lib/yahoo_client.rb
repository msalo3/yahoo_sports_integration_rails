# frozen_string_literal: true

class YahooAPI
  # require 'net/http'
  require 'rest-client'

  attr_accessor :config

  BASE_URL = "https://fantasysports.yahooapis.com/fantasy/v2/"

  def initialize(connection)
    @access_token = connection.access_token
    Rails.logger.level = 0
  end

  def get_league(id = "36671", sport = "nhl")
    url = 'league/' + sport + '.l.' + id + '?format=json'
    data = RestClient.get BASE_URL + url, {:Authorization => 'Bearer ' + @access_token.to_s}
    
    logger.debug data
    
    response = JSON.parse(data)
  end

  private

  class UnauthorizedError < StandardError; end

end
