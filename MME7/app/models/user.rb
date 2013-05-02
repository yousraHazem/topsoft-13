#encoding: UTF-8
class User < ActiveRecord::Base



 #Author: Donia Amer Shaarawy 22-0270
  #these are the attributes needed for a user also though are out valdiations that are need for the input of sign up 
  attr_accessible :address, :email, :name, :isAdmin, :phone_Nr, :username, :password, :password_confirmation
  has_secure_password

  before_save { |user| user.email = email.downcase }
  before_save { |user| user.username = username.downcase }
  before_save :create_remember_token

  validates_presence_of :name, :message => "لا يوجد هذا الاسم"
  validates_length_of :name, :maximum => 50, :message => "إسم يجب تكون ٥٠ احرف"

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates_presence_of :email, :message =>"لا يوجد ايميل "
  validates_format_of :email, :with => VALID_EMAIL_REGEX, :message => " هذ لبريد للكتروني غير صحيح"
  validates_uniqueness_of :email, :case_sensitive => false, :message => "يرجى احتيار ايميل أحر"

  validates_presence_of :username, :message => "لا يوجد سم المستخدم"
  validates_length_of :username, :maximum => 255, :message => "الحد الاقصى ٢٠ حرف"
  validates_uniqueness_of :username, :message => "يرجى احتيار سم المستخدم أحر"
  validates_uniqueness_of :username, :case_sensitive => false

  validates_presence_of :password, :message => "لا يوجد كلمة السر"
  validates_length_of :password, :within => 6..20, :message => "كلمة السر يجب تكون ٦ احرف "
  validates_confirmation_of :password, :message => "كلمت سر غير متطابقة"
  validates_presence_of :password_confirmation, :message => "لا يوجد كلمة السر"  
  validates_length_of :password_confirmation, :within => 6..20, :message => "كلمة السر يجب تكون ٦ احرف "


  #Author: Donia Amer Shaarawy 22-0270
  #this is a method so I could be able to use the remember token so we could remember our user returns the user 
  private
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end 
     #Author: Donia Amer Shaarawy 22-0270
     #takes in all the args for a user from facebook and returs a record for this facebook user
      def self.from_omniauth(auth)
      where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.email = auth.info.email
      user.password = "iamapassword"
      user.password_confirmation = "iamapassword"
      user.username = auth.info.email
      user.address = auth.info.location
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end  

end
