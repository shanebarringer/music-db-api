class AlbumSerializer < ActiveModel::Serializer
  attributes :id, :title, :year

  belongs_to :artist do
    object.artist.name
  end
  has_many :songs

end
