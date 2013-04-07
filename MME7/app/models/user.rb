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
class User < ActiveRecord::Base
  attr_accessible :address, :email, :name, :isAdmin, :phone_Nr, :username, :password, :password_confirmation
   has_secure_password

 before_save { |user| user.email = email.downcase }
  before_save { |user| user.username = username.downcase }
    before_save :create_remember_token

  validates_presence_of :name
  validates_length_of :name, :maximum => 50

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates_presence_of :email
  validates_format_of :email, :with => VALID_EMAIL_REGEX
  validates_uniqueness_of :email, :case_sensitive => false


  validates_presence_of :username
  validates_length_of :username, :maximum => 20
  validates_uniqueness_of :username
  validates_uniqueness_of :username, :case_sensitive => false

  validates_presence_of :password 
  validates_length_of :password, :within => 6..20
  validates_confirmation_of :password
  validates_presence_of :password_confirmation  
  validates_length_of :password_confirmation, :within => 6..20



  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end

end

