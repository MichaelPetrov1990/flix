class AddFiledsToMovies < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :released_on, :date
    add_column :movies, :description, :text
  end
end
