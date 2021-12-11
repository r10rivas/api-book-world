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
class Book < ApplicationRecord
  belongs_to :editorial
  has_many :book_genres
  has_many :genres, through: :book_genres

  validates :title, :publication_date, presence: true
  validate :validate_genres_assignment

  private

  def validate_genres_assignment
    errors.add(:genres, :blank, message: 'must exist') unless genres.length > 0
  end
end
