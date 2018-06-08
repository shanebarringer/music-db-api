class CreateAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :albums do |t|
      t.string :title
      t.string :artist_id
      t.string :year

      t.timestamps
    end
  end
end
