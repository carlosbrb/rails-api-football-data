class Team < ApplicationRecord
  has_and_belongs_to_many :leagues
  has_many :players

  def add_players(data)
    players = data.team_players(fd_id)
    players.each do |player|
      self.players.build(
        name: player['name'], position: player['position'],
        jersey_number: player['jerseyNumber'],
        date_of_birth: player['dateOfBirth'],
        nationality: player['nationality'],
        contract_until: player['contractUntil']
      )
    end
  end

  def players_count
    players.count
  end
end
