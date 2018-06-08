100.times do
  puts 'adding Artist'
  artist = Artist.new(
    name: FFaker::Music.artist,
    description: FFaker::HipsterIpsum.sentence,
    genre: FFaker::Music.genre,
    favorite_venue: FFaker::Venue.name
  )
  next unless artist.save
  (1..5).to_a.sample.times do
    puts "Adding album for #{artist.name}"
    album = Album.create(
      title: FFaker::Music.album,
      year: FFaker::Vehicle.year,
      artist_id: artist.id
    )
    (7..14).to_a.sample.times do
      puts "Adding songs for #{album.title}"
      Song.create(
        name: FFaker::Music.song,
        artist_id: artist.id,
        album_id: album.id
      )
    end
  end
end
