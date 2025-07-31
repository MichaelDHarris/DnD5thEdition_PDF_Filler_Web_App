class CreateRaceLanguages < ActiveRecord::Migration[7.1]
  def change
    create_table :race_languages do |t|
      t.references :race, null: false, foreign_key: true
      t.references :language, null: false, foreign_key: true

      t.timestamps
    end
  end
end
