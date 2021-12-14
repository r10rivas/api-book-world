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
FactoryBot.define do
  factory :writer do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    date_birth { Faker::Date.between(from: '1972-09-23', to: '1988-09-25') }
    country
  end
end
