require 'spec_helper'

describe BudgetSourcesController do

  def valid_attributes
    {:name => 'Market', :amount => 100000 }
  end

  def invalid_attributes
   {:name => '', :amount => 100000 }
  end

  def update_attributes
  {:name => 'Marketing', :amount => 100000}
   end

     describe "GET index" do
      it "assigns all sources as @sources" do
      sources = BudgetSource.create! valid_attributes
      get :index
      assigns(:sourcess).should eq([sources])
      end
      end
end   
