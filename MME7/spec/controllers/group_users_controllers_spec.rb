describe "join" do
    describe "with valid params" do
      it "creates a new groupuser" do
        expect {
          post :join, {:groupuser => valid_attributes}
        }.to change(GroupUser, :count).by(1)
      end

      it "assigns a newly created groupuser as @groupuser" do
        groupuser :groupuser, {:groupuser => valid_attributes}
        assigns(:groupuser).should be_a(GroupUser)
        assigns(:groupuser).should be_persisted
      end

      it "redirects to the group show " do
        post :join, {:groupuser => valid_attributes}
        response.should redirect_to(:controller => 'groups',:action => "show")
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved post as @groupuser" do
        # Trigger the behavior that occurs when invalid params are submitted
        GroupUser.any_instance.stub(:save).and_return(false)
        post :join, {:groupuser => valid_attributes}
        assigns(:groupuser).should be_a_new(GroupUser)
      end

      it "re-renders the show group template" do
        # Trigger the behavior that occurs when invalid params are submitted
        GroupUser.any_instance.stub(:save).and_return(false)
        post :join, {:GroupUser => valid_attributes}
    response.should redirect_to(:controller => 'groups',:action => "show")
      end
    end
  end