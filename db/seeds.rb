# --- USER SEED DATA --- #
User.destroy_all

u1 = User.create(:name => 'Armando', :password => 'chicken', :email => 'armando2a2r@gmail.com', :address => '212 Bridge Rd, Glebe NSW 2037', :admin => true);
u2 = User.create(:name => 'Lucia', :password => 'chicken', :email => 'lucia@prestado.com', :address => '56-58 York Street, Level M, Sydney NSW 2000');
u3 = User.create(:name => 'Peter', :password => 'chicken', :email => 'peter@prestado.com', :address => '56/58 Beach Road, Bondi Beach NSW 2026');
u4 = User.create(:name => 'Sally', :password => 'chicken', :email => 'sally@prestado.com', :address => '11 Patterson Street, Double Bay NSW 2028');
u5 = User.create(:name => 'John', :password => 'chicken', :email => 'john@prestado.com', :address => '67 Frenchmans Rd, Randwick NSW 2031');

# --- PRODUCTS SEED DATA -- #
Product.destroy_all

p1 = Product.create(:name => 'White Shirt', :brand => 'Polo', :gender => 'male', :size => 'L', :colour => 'white', :description => 'The Stretch Slim Shirt from Burton Menswear is a classic white dress shirt with a functional, comfortable twist. The button-through shirt is made of a cotton-rich stretch fabric and features dark grey buttons for contrast detail.', :rate_daily => '20');
p2 = Product.create(:name => 'Skater Skirt', :brand => 'Boohoo', :gender => 'female', :size => '12', :colour => 'red', :description => 'Update your 24-hour wardrobe with the Atmos&Here Solitaire Wrap Mini Skirt. Made from white crepe, the piece has a flattering A-line silhouette and a wrap front.', :rate_daily => '15');
p3 = Product.create(:name => 'Smart Polo', :brand => 'Zara', :gender => 'female', :size => 'M', :colour => 'blue', :description => 'Be casual, be cool in the Spark Polo Shirt from Jack & Jones - cut from a premium cotton fabric in a classic polo design. Featuring a contrast grey marle section to break up the shirt.', :rate_daily => '5');
p4 = Product.create(:name => 'Boots', :brand => 'Camper', :gender => 'female', :size => '8', :colour => 'brown', :description => "Tap into the season's retro redux with the soft microsuede Therapy Hanover boots. This thigh-high pair looks best with mini hemlines.
- Calf Circumference: 40cm
- Soft, grey microsuede upper
- Round toe
- Pull-on design
- 8cm heel", :rate_daily => '10');
p5 = Product.create(:name => 'Casual Suit', :brand => 'Emidio Tucci', :gender => 'Male', :size => 'L', :colour => 'black', :description => "Tap into the season's retro redux with the soft microsuede Therapy Hanover boots. This thigh-high pair looks best with mini hemlines.

- Calf Circumference: 40cm
- Soft, grey microsuede upper
- Round toe
- Pull-on design
- 8cm heel", :rate_daily => '50');
p6 = Product.create(:name => 'Jeans', :brand => 'Levis', :gender => 'male', :size => 'L', :colour => 'grey', :description => 'The Levis Slim Jeans are a denim classic. The faded wash and love-worn look make them an ideal everyday pair.', :rate_daily => '5');
p7 = Product.create(:name => 'Dress', :brand => 'H&M', :gender => 'female', :size => 'L', :colour => 'black', :description => 'The Keep On Swinging Wrap Dress from Lioness is crafted from a silky-smooth and lightweight fabric in a flattering wrap design. Just add heels for a show-stopping nighttime look.', :rate_daily => '10');
p8 = Product.create(:name => 'shoes', :brand => 'Nike', :gender => 'male', :size => '42', :colour => 'yellow', :description => 'Designed for the dapper gentleman, the Double Oak Mills Samuel Lace Shoes are made from smooth leather with a polished finish. The snipped-toe profile is topped with distinct stitching for a handsome touch.', :rate_daily => '10');
p9 = Product.create(:name => 'Casual Blazer', :brand => 'Hugo Boss', :gender => 'male', :size => 'L', :colour => 'dark-grey', :description => 'Ace smart-casual style in the Sks1 Char Brkn Puppy Jacket from Burton Menswear. The crosshatch pattern adds tone and class to the standard blazer.', :rate_daily => '30');
p10 = Product.create(:name => 'Jeans', :brand => 'Lois', :gender => 'female', :size => 'L', :colour => 'red', :description => 'Jeans are a denim classic. The faded wash and love-worn look make them an ideal everyday pair.', :rate_daily => '5');

# --- CATEGORY SEED DATA -- #
Category.destroy_all

c1 = Category.create(:name => 'shirt');
c2 = Category.create(:name => 'skirt');
c3 = Category.create(:name => 'polo');
c4 = Category.create(:name => 'shoes');
c5 = Category.create(:name => 'suit and blazer');
c6 = Category.create(:name => 'jumper and cardigan');
c7 = Category.create(:name => 'coats and jackets');
c8 = Category.create(:name => 'dress');
c9 = Category.create(:name => 'top');
c10 = Category.create(:name => 'jeans');
c11 = Category.create(:name => 'trousers and shorts');




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

i1 = Image.create(:name => 'shirt');
i2 = Image.create(:name => 'skirt');
i3 = Image.create(:name => 'polo');
i4 = Image.create(:name => 'boots');
i5 = Image.create(:name => 'suit');
i6 = Image.create(:name => 'blue shirt');



#bookings belongs_to user
u1.bookings << b3
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
p6.bookings << b6

#products belongs_to category
c1.products << p1
c2.products << p2
c3.products << p3
c4.products << p4
c5.products << p5
c10.products << p6
c8.products << p7
c4.products << p8
c7.products << p9
c10.products << p10



#products belongs_to user
u1.products << p1
u2.products << p2
u3.products << p3
u4.products << p4
u5.products << p5
u3.products << p6
u2.products << p7
u1.products << p8
u1.products << p9
u1.products << p8
u3.products << p9
u3.products << p10


#image belongs_to products
p1.images << i1
p2.images << i2
p3.images << i3
p4.images << i4
p5.images << i5
p1.images << i6
