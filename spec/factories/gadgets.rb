FactoryGirl.define do
  factory :gadget do
    gadget_type "MyString"
    description "MyText"
    price 1
    owner 1
    city "MyString"
    active false
    instant 1
    listing_name "MyString"
  end
end
