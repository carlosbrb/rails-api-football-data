class CreateLeagues < ActiveRecord::Migration[5.1]
  def change
    create_table :leagues do |t|
      t.string :caption
      t.integer :year

      t.timestamps
    end
  end
end
