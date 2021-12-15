editorials = %w[Anagrama Almadía Ariel Lumen Salamandra Urano]

editorials.each do |editorial|
  Editorial.find_or_create_by(name: editorial) do |new_editorial|
    new_editorial.country_id = Country.pluck(:id).sample
  end
end
