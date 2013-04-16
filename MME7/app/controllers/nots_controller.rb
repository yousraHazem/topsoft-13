class NotsController < ApplicationController




 def index

 	 respond_to do |format|
        format.html {redirect_to :controller=>'subjects',:action=>'list'}
        format.js
        end
 	end	
 	
end
