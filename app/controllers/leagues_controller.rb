class LeaguesController < ApplicationController
  def import
    begin
      data = FootballDataService.new
      if data.find_league(params[:id]).blank?
        message = '{"message": "Not found"}'
        status = 404
      elsif !League.find_by_league(params[:id]).blank?
        message = '{"message": "League already imported"}'
        status = 409
      else
        League.import(params[:id], data)
        message = '{"message": "Successfully imported"}'
        status = 201
      end
    rescue Faraday::ConnectionFailed
      message = '{"message": "Server Error"}'
      status = 504
    end
    render json: message, status: status
  end

  def total_players
    league = League.find_by_league(params[:id])
    if league.blank?
      message = ''
      status = 404
    else
      message = "{'total': #{league.players.count}}"
      status = 200
    end
    render json: message, status: status
  end
end
