class AddLeagueToLeagues < ActiveRecord::Migration[5.1]
  def change
    add_column :leagues, :league, :string
  end
end
