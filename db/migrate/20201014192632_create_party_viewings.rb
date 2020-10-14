class CreatePartyViewings < ActiveRecord::Migration[5.2]
  def change
    create_table :party_viewings do |t|
      t.references :user, foreign_key: true
      t.integer :movie_id
      t.string :movie_title
      t.string :date
      t.string :time
      t.integer :runtime
    end
  end
end
