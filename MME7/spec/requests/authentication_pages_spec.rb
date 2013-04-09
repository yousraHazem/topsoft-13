#Author: Donia Amer Shaarawy 22-0270
#this is for the login and logout requests and pirmission
require 'FactoryGirl'
require 'spec_helper'
describe "Authentication" do

  subject { page }

  describe "login page" do
    before { visit login_path }

    it { should have_selector('h1',    text: 'تسجيل دخول') }
    it { should have_selector('title', text: 'Log in') }
  end
  describe "login" do
   before { visit login_path }
    describe "with invalid information" do
     before { click_button "دخول" }
     it { should have_selector('title', text: 'Log in') }
     it { should have_selector('div.alert.alert-error', text: 'Invalid') }
    end
  end
  describe "with valid information" do
    let(:user) { FactoryGirl.create(:user) }
    before do
     fill_in "username",    with: user.username
     fill_in "Password", with: user.password
     click_button "Log in"
   end
 end
    it { should have_selector('title', text: user.name) }
    it { should have_link('Profile', href: user_path(user)) }
    it { should have_link('Log out', href: logout_path) }
    it { should_not have_link('Log in', href: login_path) }
    end
   describe "followed by Logout" do
     before { click_link "Log out" }
     it { should have_link('Log in') }
   end



