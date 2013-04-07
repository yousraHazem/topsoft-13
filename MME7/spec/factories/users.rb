# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "MyString"
    email "MyString"
    phone_Nr "MyString"
    address "MyString"
    username "MyString"
    isAdmin false
  end
end
