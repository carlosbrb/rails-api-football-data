# Service class to get data from https://www.football-data.org/
# Using gem: https://github.com/delta4d/football-data
class FootballDataService
  attr_reader :competitions
  def initialize
    @competitions = FootballData.fetch(:competitions)
  end

  def find_league(code)
    @competitions.select { |competition| competition['league'] == code }
  end

  def league_teams(code)
    league = find_league(code).first
    response = FootballData.fetch(:competitions, :teams, id: league['id'])
    response.key?('error') ? nil : response['teams']
  end

  def team_players(id)
    response = FootballData.fetch(:teams, :players, id: id)
    response.key?('error') ? nil : response['players']
  end
end
