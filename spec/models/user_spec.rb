require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'with attributes name, email, password' do
      @user = User.new(:name => "Hannah Miller", :email => "hannah_m@example.com", :password => "1234", :password_confirmation => "1234")
      expect(@user).to be_valid
    end
    it 'with missing name' do
      @user = User.new(:name => nil, :email => "hannah_m@example.com", :password => "1234", :password_confirmation => "1234")
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end
    it 'with missing email' do
      @user = User.new(:name => "Hannah Miller", :email => nil, :password => "1234", :password_confirmation => "1234")
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'with missing password' do
      @user = User.new(:name => "Hannah Miller", :email => "hannah_m@example.com", :password => nil, :password_confirmation => "1234")
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'with password and password_confirmation not matching' do
      @user = User.new(:name => "Hannah Miller", :email => "hannah_m@example.com", :password => "123456", :password_confirmation => "1234")
      expect(@user.password).to_not eq(@user.password_confirmation)
    end
    it 'email cannot be case sensitive' do
      @user = User.new(:name=> "Hannah Miller", :email=> "hannah_m@example.com" , :password=> '123456', :password_confirmation=> '123456')
      @user.save
      @newuser = User.new(:name=> "Hannah Miller", :email=> "HANNAH_M@example.com", :password=> '123456', :password_confirmation=> '123456')  
      @newuser.save
      expect(@newuser).to_not be_valid
    end
    it 'with password of minimun length' do
      @user = User.new(:name => "Hannah Miller", :email => "hannah_m@example.com", :password => "12", :password_confirmation => "12")
      expect(@user).to_not be_valid
    end
  end
  

  describe '.authenticate_with_credentials' do
    it 'with attributes name, email, password' do
      @user = User.create(:name => "Hannah Miller", :email => "hannah_m@example.com", :password => "1234", :password_confirmation => "1234")
      expect(User.authenticate_with_credentials("hannah_m@example.com","1234")).to_not be_nil
    end
    it 'with spaces around email' do
      @user = User.create(:name => "Hannah Miller", :email => "hannah_m@example.com", :password => "1234", :password_confirmation => "1234")
      expect(User.authenticate_with_credentials(" hannah_m@example.com ","1234")).to_not be_nil
    end
    it 'with different cases in email' do
      @user = User.new(:name => "Hannah Miller", :email => "hannah_m@example.com", :password => "1234", :password_confirmation => "1234")
      @user.save
      expect(User.authenticate_with_credentials("HanNah_m@example.com","1234")).to_not be_nil
    end
end
end