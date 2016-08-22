# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string
#  brand       :string
#  gender      :string
#  size        :string
#  colour      :string
#  description :text
#  category_id :integer
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Product < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :bookings
  has_many :images

  def main_image
    images.first
  end

  def carousel_images
    images[1..-1]
  end

  def can_edit?(user)
      user_id == user.id || user.admin? # user_id is self.user_id (which is product.user_id)
  end

end
