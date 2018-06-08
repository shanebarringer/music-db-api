class ArtistSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :genre, :favorite_venue

  has_many :albums

end
