# == Schema Information
#
# Table name: book_genres
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  book_id    :bigint           not null
#  genre_id   :bigint           not null
#
# Indexes
#
#  index_book_genres_on_book_id   (book_id)
#  index_book_genres_on_genre_id  (genre_id)
#
# Foreign Keys
#
#  fk_rails_...  (book_id => books.id)
#  fk_rails_...  (genre_id => genres.id)
#
require 'rails_helper'

RSpec.describe BookGenre, type: :model do
  describe 'Validations' do
    subject { build(:book_genre) }

    it 'Relation with genre (has_one)' do
      should belong_to(:book)
    end

    it 'Relation with genre (has_one)' do
      should belong_to(:genre)
    end
  end
end
