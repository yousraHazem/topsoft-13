require 'factory_girl'

FactoryGirl.define do
  factory :project do |f|
    f.name  "John"
    f.start_date "4/29/2013"
    f.end_date "5/5/2013"
    f.description "dddd"

  end
end
