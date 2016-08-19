# --- USER SEED DATA --- #
User.destroy_all
u1 = User.create(:name => 'Armando', :password => 'chicken1', :email => 'armando2a2r@gmail.com');
u2 = User.create(:name => 'Lucia', :password => 'chicken1', :email => 'lucia@prestado.com');
u4 = User.create(:name => 'Sally', :password => 'chicken1', :email => 'sally@prestado.com');
u5 = User.create(:name => 'John', :password => 'chicken1', :email => 'john@prestado.com');
