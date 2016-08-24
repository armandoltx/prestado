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
#  rate_daily  :decimal(, )
#

class Product < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :bookings
  has_many :images

  def main_image
    images.first
  end


  def main_image_url
    #  return a placeholder/default image if no image has been uploaded
    if images.first.present?
      @image_url = images.first.url
    else
     @image_url = "/assets/logo.png"
    end
  end


  def carousel_images
    images[1..-1]
  end

  def can_edit?(user)
      user_id == user.id || user.admin? # user_id is self.user_id (which is product.user_id)
  end

  def self.keyword_search(keywords)   #make keyword_search a class level method, we try to make the funciton in controller slim
    keywords = "%" + keywords+ "%"
    Product.where("name ILIKE ? OR brand ILIKE ? OR gender ILIKE ? OR size ILIKE ? OR colour ILIKE ? OR description ILIKE ?", keywords, keywords, keywords, keywords, keywords, keywords)  # Acitive Record saves us from writing DB queries in SQL manualy/direclty. here LIKE Is a SQL operator, it is not case sensitive,   % % is like * in reqgular expresison ( anything ) %% is called wildcard  ? is for protecting from SQL injection
  end

end
