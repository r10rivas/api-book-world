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
class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: { case_sensitive: true }, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ } 
  validates :password_digest, presence: true
end
