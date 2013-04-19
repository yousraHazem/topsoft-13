# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  phone_Nr   :string(255)
#  address    :string(255)
#  username   :string(255)
#  isAdmin    :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

#Author Donia Amer Shaarawy 22-0270
#these are all the valdation tests needed for the user model 
require 'spec_helper'

describe User, scope: true  do

  before { @user = User.new(name: "Example User", email: "user@example.com", phone_Nr: "123456788", isAdmin: false,
    	address: "nr st distric city", username: "username", password: "password", password_confirmation: "password") }

  subject { @user }

  it { should respond_to(:name) } 
  it { should respond_to(:email) }
  it { should respond_to(:phone_Nr) }
  it { should respond_to(:address) }
  it { should respond_to(:username) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:remember_token) }
  it { should respond_to(:authenticate) }

  it { should be_valid }

  context "when name is not present" do
    before { @user.name = " " }
    it { should_not be_valid }
  end

 context "when email is not present" do
    before { @user.email = " " }
    it { should_not be_valid }
  end

  context "when username is not present" do
    before { @user.username = " " }
    it { should_not be_valid }
  end

  context "when name is too long" do
    before { @user.name = "a" * 51 }
    it { should_not be_valid }
  end

  context "when username is too long" do
    before { @user.username = "a" * 21 }
    it { should_not be_valid }
  end

  context "when email format is invalid" do
    it "should be invalid" do
      emailAddresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      emailAddresses.each do |invalid_emailAddress|
        @user.email = invalid_emailAddress
        @user.should_not be_valid
      end      
    end
  end

  context "when email format is valid" do
    it "should be valid" do
      emailAddresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      emailAddresses.each do |valid_emailAddress|
        @user.email = valid_emailAddress
        @user.should be_valid
      end      
    end
  end

    context "when username is already taken" do
    before do
      user_with_same_username = @user.dup
       user_with_same_username.username = @user.username.upcase
      user_with_same_username.save
    end

    it { should_not be_valid }
  end

   context "when email address is already taken" do
    before do
      user_with_same_email = @user.dup
       user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end

    it { should_not be_valid }
  end

   context "when phone number is not unique" do
    before do
      user_with_same_phone_Nr = @user.dup
       user_with_same_phone_Nr.phone_Nr = @user.phone_Nr
      user_with_same_phone_Nr.save
    end

    it { should_not be_valid }
  end

  context "when password is not present" do
    before { @user.password = @user.password_confirmation = " " }
    it { should_not be_valid }
 end

 context "when password doesn't match confirmation" do
   before { @user.password_confirmation = "mismatch" }
   it { should_not be_valid }
 end

  context "when password confirmation is nil" do
   before { @user.password_confirmation = nil }
   it { should_not be_valid }
 end

 context "with a password that's too short" do
    before { @user.password = @user.password_confirmation = "a" * 5 }
    it { should be_invalid }
  end

  context "return value of authenticate method" do
   before { @user.save }
   let(:found_user) { User.find_by_username(@user.username) }

  context"with valid password" do
    it { should == found_user.authenticate(@user.password) }
  end
#let method provides a convenient way to create local variables inside tests. 
  context "with invalid password" do
    let(:user_for_invalid_password) { found_user.authenticate("invalid") }

    it { should_not == user_for_invalid_password }
    specify { user_for_invalid_password.should be_false }
  end
end
 context "remember token" do
    before { @user.save }
    its(:remember_token) { should_not be_blank }
  end

end