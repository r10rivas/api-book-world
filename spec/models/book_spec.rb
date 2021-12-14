# == Schema Information
#
# Table name: books
#
#  id               :bigint           not null, primary key
#  publication_date :date
#  title            :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  editorial_id     :bigint           not null
#
# Indexes
#
#  index_books_on_editorial_id  (editorial_id)
#
# Foreign Keys
#
#  fk_rails_...  (editorial_id => editorials.id)
#
require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'Validations' do
    let(:genres) { create_list(:genre, 3) }
    let(:book) { build(:book) }

    before(:each) do
      book.genres = genres.sample(2)
    end

    subject { book }

    it 'Presence of title' do
      should validate_presence_of(:title)
    end

    it 'Presence of publication_date' do
      should validate_presence_of(:publication_date)
    end

    it 'Relation with editorial (belongs_to)' do
      should belong_to(:editorial)
    end

    it 'Relation with genre (has_many)' do
      should have_many(:genres).through(:book_genres)
    end

    it 'Relation with writer (has_many)' do
      should have_many(:writers).through(:book_writers)
    end
  end
end
