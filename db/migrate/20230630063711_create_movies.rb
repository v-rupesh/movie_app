class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :year
      t.string :poster
      t.string :imdb_id

      t.timestamps
    end
  end
end
