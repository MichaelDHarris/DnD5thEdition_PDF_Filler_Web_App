class CreateRaces < ActiveRecord::Migration[7.1]
  def change
    create_table :races do |t|
      t.string :name
      t.integer :speed
      t.string :ability_bonus
      t.string :languages
      t.string :string

      t.timestamps
    end
  end
end
