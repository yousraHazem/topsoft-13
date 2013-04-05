require "spec_helper"

describe PostsController do

  it "should use PostsController" do
    controller.should be_an_instance_of(PostsController)
  end

  describe "GET 'newPost'" do
    it "should be successful" do
      post = Post.new 
      get 'newPost'
      response.should be_success
    end
  end


  describe "GET 'editPost'" do
    it "should be successful and get the post with the given id" do
      post = Post.find() 
      get 'editPost'
      response.should be_success
    end
  end

  describe 'createPost' do
    end
  end

  describe 'updatePost' do
    end
  end



  
end

# describe "GET #index" do
#     it "responds successfully with an HTTP 200 status code" do
#       get :index
#       expect(response).to be_success
#       expect(response.code).to eq(200)
#     end

#     it "renders the index template" do
#       get :index
#       expect(response).to render_template("index")
#     end

#     it "loads all of the posts into @posts" do
#       post1, post2 = Post.create!, Post.create!
#       get :index

#       expect(assigns(:posts)).to match_array([post1, post2])
#     end
#   end