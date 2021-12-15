20.times do
  Genre.find_or_create_by(name: Faker::Book.genre)
end
