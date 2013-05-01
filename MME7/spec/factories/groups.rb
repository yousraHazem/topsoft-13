require 'factory_girl'

FactoryGirl.define do
  factory :group do |f|
    f.group_name "John"
    f.description "Doe"
  end
end