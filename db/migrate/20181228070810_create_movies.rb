class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :name
      # t.integer :api_id
      t.string :release_date
      t.string :overview
      t.string :image
      t.string :image2
      # t.string :genre
      # t.string :homepage
      # t.string :production_companies
      # t.integer :runtime

      t.timestamps
    end
  end
end
