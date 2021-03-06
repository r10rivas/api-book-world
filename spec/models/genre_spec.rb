# == Schema Information
#
# Table name: genres
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Genre, type: :model do
  describe 'Validations' do
    subject { build(:genre) }

    it 'Presence of name' do
      should validate_presence_of(:name)
    end
  end
end
