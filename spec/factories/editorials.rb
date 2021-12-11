# == Schema Information
#
# Table name: editorials
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  country_id :bigint           not null
#
# Indexes
#
#  index_editorials_on_country_id  (country_id)
#
# Foreign Keys
#
#  fk_rails_...  (country_id => countries.id)
#
FactoryBot.define do
  factory :editorial do
    name { %w[Anagrama Almadía Ariel Lumen Salamandra Urano].sample }
    country
  end
end
