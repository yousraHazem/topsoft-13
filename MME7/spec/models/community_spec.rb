
require "spec_helper"

describe Community do
  it "creates a new community" do
    Resala = Community.create!(title: "Resala", social_profile_info: "NGO", contact_info: "222")
    MUN = Community.create!(title: "MUN", social_profile_info: "NGO", contact_info: "342")
 
  end
end