class ArtistSerializer < ActiveModel::Serializer
  attributes :name, :description, :genre, :favorite_venue

  has_many :albums

end
