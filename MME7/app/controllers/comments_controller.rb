class CommentsController < ApplicationController
# As a system I can delete a comment
+    def destroy
+
+        @c = Comment.find(params[:id])
+        if isCreator(current_user.id) == 'true'
+            @c.destroy
+            flash[:notice] = "Comment successfully deleted!"
+       
+        else
+            flash[:error] = "not allowed"
+          
+    end
 end

