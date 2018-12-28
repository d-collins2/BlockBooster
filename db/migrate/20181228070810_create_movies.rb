class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :name
      t.string :release_date
      t.string :overview

      t.timestamps
    end
  end
end
