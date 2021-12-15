20.times do
  Book.find_or_create_by(title: Faker::Book.title, publication_date: Faker::Date.between(from: '1972-10-10', to: '2010-10-10')) do |new_book|

    new_book.editorial_id = Editorial.pluck(:id).sample
    new_book.genre_ids = Genre.pluck(:id).sample(3)
    new_book.writer_ids = Writer.pluck(:id).sample(2)
  end
end
