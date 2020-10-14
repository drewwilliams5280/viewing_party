class CreateViewingParty < ActiveRecord::Migration[5.2]
  def change
    create_table :viewing_parties do |t|
      t.string :movie_title
      t.integer :runtime
      t.date :date
      t.time :time
      t.references :user, foreign_key: true
      t.integer :movie_id

      t.timestamps
    end
  end
end
