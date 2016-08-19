# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  address         :text
#  image           :string
#  password_digest :string
#  top_size        :string
#  bottom_size     :string
#  foot_size       :string
#  admin           :boolean
#  renter          :boolean
#  owner           :boolean
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  has_secure_password
  has_many :bookings
  has_many :products
  validates :email, :presence => true, :uniqueness => true
end
