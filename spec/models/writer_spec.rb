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
require 'rails_helper'

RSpec.describe Writer, type: :model do
  describe 'Model validations' do
    subject { build(:writer) }

    it 'Presence of first_name' do
      should validate_presence_of(:first_name)
    end

    it 'Presence of last_name' do
      should validate_presence_of(:last_name)
    end

    it 'Presence of date_birth' do
      should validate_presence_of(:date_birth)
    end

    it 'Relation with country (belongs_to)' do
      should belong_to(:country)
    end
  end
end
