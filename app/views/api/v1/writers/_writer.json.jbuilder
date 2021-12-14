json.extract! writer, :id, :first_name, :last_name, :date_birth
json.country writer.country.name
json.set! :books do
  json.array! writer.books do |book|
    json.title book.title
    json.publication_date book.publication_date.strftime("%F")
  end
end
