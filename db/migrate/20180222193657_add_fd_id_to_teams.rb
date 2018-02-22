class AddFdIdToTeams < ActiveRecord::Migration[5.1]
  def change
    add_column :teams, :fd_id, :integer
  end
end
