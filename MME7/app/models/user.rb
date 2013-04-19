#encoding: UTF-8
class User < ActiveRecord::Base
 #Author: Donia Amer Shaarawy 22-0270
  #these are the attributes needed for a user also though are out valdiations that are need for the input of sign up 
  attr_accessible :address, :email, :name, :isAdmin, :phone_Nr, :username, :password, :password_confirmation
  has_secure_password


has_many :posts
  has_many :comments
  belongs_to :task
  belongs_to :group
  has_and_belongs_to_many :budget_items
  has_many :project_users
  has_many :projects , :through => :project_users

  has_many :groups_users 
  has_many :groups , :through => :group_users 



   has_many :task_users
  has_many :tasks , :through => :task_users

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
  validates_length_of :username, :maximum => 20, :message => "الحد الاقصى ٢٠ حرف"
  validates_uniqueness_of :username, :message => "يرجى احتيار سم المستخدم أحر"
  validates_uniqueness_of :username, :case_sensitive => false

  #Author: Donia Amer Shaarawy 22-0270
  #this is a method so I could be able to use the remember token so we could remember our user returns the user 
  private
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end   

end
