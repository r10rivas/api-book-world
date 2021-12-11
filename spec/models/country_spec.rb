# == Schema Information
#
# Table name: countries
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Country, type: :model do
  describe 'Validations' do
    subject { build(:country) }

    it 'Presence of name' do
      should validate_presence_of(:name)
    end

    it 'Relation with editorial (has_many)' do
      should have_many(:editorials)
    end
  end
end
