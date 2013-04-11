#Author: Donia Amer Shaarawy 22-0270
# these are the test for the requests which is redirecting to the user page and how the sign up page should look like and whats in it 

require 'spec_helper'

describe "User pages" do

  subject { page }

   describe "profile page" do
  let(:user) { FactoryGirl.create(:user) }
   before { visit user_path(user) }

    it { should have_selector('h1',    text: user.name) }
    it { should have_selector('title', text: user.name) }
  end
  
  describe "signup page" do

    before { visit signup_path }
    it { should have_selector('h1',    text: 'شتراك') }
    it { should have_selector('title', text: 'Sign up') }

    let(:submit) { "إنضم" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "user@example.com"
        fill_in "Phone_Nr",     with: "1234567890"
        fill_in "address",      with: "st city"
        fill_in "username",     with: "username"
        fill_in "Password",     with: "Password"
        fill_in "Confirmation", with: "Password"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
        it { should have_link('Log out') }
      end
    end
  end
end