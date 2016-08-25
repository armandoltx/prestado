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
#  latitude        :float
#  longitude       :float
#

class User < ActiveRecord::Base
  has_secure_password
  has_many :bookings
  has_many :products

  validates :email, :presence => true, :uniqueness => true

  geocoded_by :address   #using geocoder to convert location into coordinates
  after_validation :geocode          # auto-fetch coordinates

  reverse_geocoded_by :latitude, :longitude  do |obj,results|
    if geo = results.first
      # city    = geo.city
      # zipcode = geo.postal_code
      # country = geo.country_code
      { postcode: geo.postal_code, country: geo.country_code, suburb: geo.city  }
    end
  end


  def products_near( keyword )
    user_ids = User.near( self ).map &:id
    products = Product.where('user_id in (?)', user_ids).where("name ILIKE '%#{keyword}%' OR description ILIKE '%#{keyword}%'").index_by(&:id)
    locations = {}
    products.map do |user_id, product |
      locations[user_id] = {latitude: product.user.latitude, longitude: product.user.longitude}
    end
    {products: products, locations: locations}
  end




  #to get just the suburb from the address, not to show all the address.

end
