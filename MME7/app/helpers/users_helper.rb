module UsersHelper

   #Author: Donia Amer Shaarawy 22-0270
   # Returns the Gravatar (http://gravatar.com/) for the given user. returns the picture of the user
   def gravatar_for(user)
      gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
      gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
      image_tag(gravatar_url, alt: user.name, class: "gravatar")
    end
  def isAdmin(current_user)
    User.where(:id => current_user, :isAdmin => true).exists?
  end

  def getName(user_id)
    u =  User.find(user_id).name
    return u
  end

end