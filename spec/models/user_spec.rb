# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    subject { build(:user) }

    it 'Presence of email' do
      should validate_presence_of(:email)
    end

    it 'Uniqueness of email' do
      should validate_uniqueness_of(:email)
    end

    it 'Format of email' do
      should_not allow_value('test', '@test', '.test', '@test.test', 'test@test', '.test').for(:email)
    end

    it 'Presence of password_digest' do
      should validate_presence_of(:password_digest)
    end
  end
end
