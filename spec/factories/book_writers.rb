# == Schema Information
#
# Table name: book_writers
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  book_id    :bigint           not null
#  writer_id  :bigint           not null
#
# Indexes
#
#  index_book_writers_on_book_id    (book_id)
#  index_book_writers_on_writer_id  (writer_id)
#
# Foreign Keys
#
#  fk_rails_...  (book_id => books.id)
#  fk_rails_...  (writer_id => writers.id)
#
FactoryBot.define do
  factory :book_writer do
    book
    writer
  end
end
