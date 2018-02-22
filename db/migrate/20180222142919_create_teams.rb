class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :code
      t.string :short_name

      t.timestamps
    end
  end
end
