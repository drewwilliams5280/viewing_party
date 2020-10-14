class ChangeViewingPartiesToMovieParties < ActiveRecord::Migration[5.2]
  def change
    rename_table :viewing_parties, :movie_parties
  end
end
