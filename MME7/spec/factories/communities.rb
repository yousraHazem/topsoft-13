require 'factory_girl'

FactoryGirl.define do
  factory :community do |f|
    f.title "John"
    f.social_profile_info "Doe"
    f.contact_info "user@example.com"
  end
end
