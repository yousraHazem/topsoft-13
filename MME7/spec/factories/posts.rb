require 'factory_girl'

FactoryGirl.define do
  factory :post do |f|
    f.content "John"
    f.group_id false
  end
end
