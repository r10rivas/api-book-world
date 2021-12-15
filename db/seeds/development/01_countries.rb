23.times do
  Country.find_or_create_by(name: Faker::Address.country)
end
