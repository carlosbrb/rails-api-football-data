class LeaguesController < ApplicationController
  def import
    response = Responder.new(params[:id]).process_league
    render json: response[:message], status: response[:status], format: :json
  end

  def total_players
    response = Responder.new(params[:id]).process_totals
    render json: response[:message], status: response[:status], format: :json
  end
end
