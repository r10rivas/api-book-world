# == Schema Information
#
# Table name: writers
#
#  id         :bigint           not null, primary key
#  date_birth :date
#  first_name :string
#  last_name  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  country_id :bigint           not null
#
# Indexes
#
#  index_writers_on_country_id  (country_id)
#
# Foreign Keys
#
#  fk_rails_...  (country_id => countries.id)
#
class Writer < ApplicationRecord
  belongs_to :country
  has_many :book_writers
  has_many :books, through: :book_writers

  validates :first_name, :last_name, :date_birth, presence: true
end
