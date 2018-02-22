class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.string :name
      t.string :position
      t.integer :jersey_number
      t.date :date_of_birth
      t.string :nationality
      t.string :contract_until
      t.references :team, foreign_key: true

      t.timestamps
    end
  end
end
