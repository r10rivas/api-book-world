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
  describe 'Model validations' do
    subject { build(:country) }

    it 'Presence of name' do
      should validate_presence_of(:name)
    end
  end
end
