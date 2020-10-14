class FixColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :party_guests, :viewing_party_id, :movie_party_id
  end
end
