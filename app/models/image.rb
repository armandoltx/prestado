# == Schema Information
#
# Table name: images
#
#  id         :integer          not null, primary key
#  name       :string
#  url        :string
#  product_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Image < ActiveRecord::Base
  belongs_to :products
end
