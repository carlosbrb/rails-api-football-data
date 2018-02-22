class League < ApplicationRecord
  has_and_belongs_to_many :teams, -> { distinct }
  has_many :players, through: :teams

  validates :league, uniqueness: true

  def self.import(code, data)
    league = data.find_league(code).first
    new_league = new(
      caption: league['caption'],
      league: league['league'],
      year: league['year']
    )
    new_league.add_teams(data)
    new_league.save
  end

  def add_teams(data)
    teams = data.league_teams(league)
    teams.each do |team|
      new_team = self.teams.build(
        name: team['name'],
        code: team['code'],
        short_name: team['shortName'],
        fd_id: team['id']
      )
      new_team.add_players(data)
    end
  end
end
