json.set! :books do
  json.array! @books do |book|
    json.partial! 'api/v1/books/book', book: book
  end
end
