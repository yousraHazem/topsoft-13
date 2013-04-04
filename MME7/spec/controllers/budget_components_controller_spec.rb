require 'spec_helper'

describe BudgetComponentsController do


	 describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response.code).to eq(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "loads all of the budget components of a certain budget item into @components" do
      component1, component2 = BudgetComponent.create!, BudgetComponent.create!
      get :index

      expect(assigns(:components)).to match_array([component1, component2])
    end
  end

end








