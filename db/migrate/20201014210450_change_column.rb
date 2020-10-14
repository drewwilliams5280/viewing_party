class ChangeColumn < ActiveRecord::Migration[5.2]
  def change
    change_column :movie_parties, :date, :string
    change_column :movie_parties, :time, :string
  end
end
