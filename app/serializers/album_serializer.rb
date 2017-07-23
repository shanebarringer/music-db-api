class AlbumSerializer < ActiveModel::Serializer
  attributes :id, :title, :year

  belongs_to :artist { object.artist.name }
  has_many :songs

end
