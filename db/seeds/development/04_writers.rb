10.times do
  Writer.find_or_create_by(first_name: Faker::Name.first_name,
                          last_name: Faker::Name.last_name) do |new_writer|
    new_writer.date_birth = Faker::Date.between(from: '1972-09-23', to: '1988-09-25')
    new_writer.country_id = Country.pluck(:id).sample
  end
end
