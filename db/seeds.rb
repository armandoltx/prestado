# --- USER SEED DATA --- #
User.destroy_all

u1 = User.create(:name => 'Armando', :password => 'chicken', :email => 'armando2a2r@gmail.com', :image => 'http://www.fillmurray.com/200/300');
u2 = User.create(:name => 'Lucia', :password => 'chicken', :email => 'lucia@prestado.com');
u3 = User.create(:name => 'Peter', :password => 'chicken', :email => 'peter@prestado.com');
u4 = User.create(:name => 'Sally', :password => 'chicken', :email => 'sally@prestado.com');
u5 = User.create(:name => 'John', :password => 'chicken', :email => 'john@prestado.com');

# --- PRODUCTS SEED DATA -- #
Product.destroy_all

p1 = Product.create(:name => 'White Shirt', :brand => 'Polo', :gender => 'male', :size => 'L', :colour => 'white');
p2 = Product.create(:name => 'Skater Skirt', :brand => 'Boohoo', :gender => 'female', :size => '12', :colour => 'red');
p3 = Product.create(:name => 'Smart Polo', :brand => 'Zara', :gender => 'female', :size => 'M', :colour => 'blue');
p4 = Product.create(:name => 'Boots', :brand => 'Camper', :gender => 'female', :size => '8', :colour => 'brown');
p5 = Product.create(:name => 'Casual Suit', :brand => 'Emidio Tucci', :gender => 'Male', :size => 'L', :colour => 'black');

# --- CATEGORY SEED DATA -- #
Category.destroy_all

c1 = Category.create(:name => 'shirt');
c2 = Category.create(:name => 'skirt');
c3 = Category.create(:name => 'polo');
c4 = Category.create(:name => 'shoes');
c5 = Category.create(:name => 'suit');

# --- CATEGORY SEED DATA -- #
Booking.destroy_all

b1 = Booking.create(:start_time => '01-09-2016-09-12 18:00:00', :end_time => '02-09-2016-09-12 18:00:00');
b2 = Booking.create(:start_time => '30-08-2016-09-12 18:00:00', :end_time => '01-09-2016-09-12 18:00:00');
b3 = Booking.create(:start_time => '26-08-2016-09-12 18:00:00', :end_time => '27-08-2016-09-12 18:00:00');
b4 = Booking.create(:start_time => '03-09-2016-09-12 18:00:00', :end_time => '04-09-2016-09-12 18:00:00');
b5 = Booking.create(:start_time => '10-10-2016-09-12 18:00:00', :end_time => '11-10-2016-09-12 18:00:00');
b6 = Booking.create(:start_time => '12-10-2016-09-12 18:00:00', :end_time => '13-10-2016-09-12 18:00:00');

# --- IMAGE SEED DATA -- #
Image.destroy_all

i1 = Image.create(:name => 'shirt', :url => 'http://www.fillmurray.com/200/300');
i2 = Image.create(:name => 'skirt', :url => 'http://www.fillmurray.com/200/300');
i3 = Image.create(:name => 'polo', :url => 'http://www.fillmurray.com/200/300');
i4 = Image.create(:name => 'boots', :url => 'http://www.fillmurray.com/200/300');
i5 = Image.create(:name => 'suit', :url => 'http://www.fillmurray.com/200/300');
i6 = Image.create(:name => 'blue shirt', :url => 'http://www.fillmurray.com/200/300');




#bookings belongs_to user
u1.bookings << b1
u2.bookings << b2
u3.bookings << b3
u4.bookings << b4
u5.bookings << b5
u1.bookings << b6


#bookings belongs_to product
p1.bookings << b1
p2.bookings << b2
p3.bookings << b3
p4.bookings << b4
p5.bookings << b5
p1.bookings << b6

#products belongs_to category
c1.products << p1
c2.products << p2
c3.products << p3
c4.products << p4
c5.products << p5

#products belongs_to user
u1.products << p1
u2.products << p2
u3.products << p3
u4.products << p4
u5.products << p5

#image belongs_to products
p1.images << i1
p2.images << i2
p3.images << i3
p4.images << i4
p5.images << i5
p1.images << i6
