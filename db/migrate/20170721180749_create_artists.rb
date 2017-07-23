class CreateArtists < ActiveRecord::Migration[5.1]
  def change
    create_table :artists do |t|
      t.string :name
      t.string :description
      t.string :genre
      t.string :favorite_venue

      t.timestamps
    end
  end
end
