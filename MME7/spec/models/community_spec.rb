require "spec_helper"

describe Community do
  it "creates a new community" do
    Community.create!(title: "resala", social_profile_info: "ngo", contact_info: "23")
    

    
  end
end