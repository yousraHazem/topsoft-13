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

     describe "GET list" do
      it "assigns all sources as @sources" do
      sources = BudgetSource.create! valid_attributes
      get :list
      assigns(:sources).should eq([sources])
      end
      end
end  