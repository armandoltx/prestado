# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  shirt      :string
#  tshirt     :string
#  polo       :string
#  suit       :string
#  dress      :string
#  skirt      :string
#  shoes      :string
#  trousers   :string
#  jacket     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ActiveRecord::Base
  has_many :products
end
