﻿module UsersHelper

<<<<<<< HEAD

 

=======
	def isAdmin(current_user)
		User.where(:id => current_user, :isAdmin => true).exists?
	end


 
>>>>>>> master

 #Author: Donia Amer Shaarawy 22-0270
 # Returns the Gravatar (http://gravatar.com/) for the given user.
 	def gravatar_for(user)
      gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
      gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
      image_tag(gravatar_url, alt: user.name, class: "gravatar")
    end
end