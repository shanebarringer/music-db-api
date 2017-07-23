class Artist < ApplicationRecord
  has_many :albums
  has_many :songs

  validates :name, uniqueness: true
end
