module PostsHelper
	#Authored by Toka Omar  id:22-1925
  	#this method takes input :group id and outputs: posts that have the same group id entered 
	def getposts (g_id)
	return Post.find(:all, :conditions => {:group_id =>g_id})
    end


    def isPostCreator(current_user, post_id)
        Post.where(:user_id => current_user, :id => post_id).exists?  
    end

    def breaking_word_wrap(text, *args)
   options = args.extract_options!
   unless args.blank?
     options[:line_width] = args[0] || 80
   end
   options.reverse_merge!(:line_width => 80)
   text = text.split(" ").collect do |word|
     word.length > options[:line_width] ? word.gsub(/(.{1,#{options[:line_width]}})/, "\\1 ") : word
   end * " "
   text.split("\n").collect do |line|
     line.length > options[:line_width] ? line.gsub(/(.{1,#{options[:line_width]}})(\s+|$)/, "\\1\n").strip : line
   end * "\n"
   end
   
end
