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
FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    publication_date { Faker::Date.between(from: '1972-10-10', to: '2010-10-10') }
    editorial
  end
end
