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
require 'rails_helper'

RSpec.describe Editorial, type: :model do
  describe 'Validations' do
    subject { build(:editorial) }
  
    it 'Presence of name' do
      should validate_presence_of(:name)
    end

    it 'Relation with country (belongs_to)' do
      should belong_to(:country)
    end
  end
end
