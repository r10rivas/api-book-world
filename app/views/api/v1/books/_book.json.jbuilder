json.extract! book, :id, :title, :publication_date

json.editorial book.editorial.name

json.genres do
  json.array! book.genres.pluck(:name)
end

json.writers do
  json.array! book.writers do |writer|
    json.full_name "#{writer.first_name} #{writer.last_name}"
    json.country writer.country.name
  end
end
