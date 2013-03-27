class PostsController < ApplicationController
# As a system I can delete a post
+    def destroy
+
+        @p = Post.find(params[:id])
+        if isCreator(current_user.id) == 'true'
+            @p.destroy
+            flash[:notice] = "post successfully deleted!"
+       
+        else
+            flash[:error] = "not allowed"
+          
+    end
 end

