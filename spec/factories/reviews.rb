FactoryGirl.define do
  factory :review do
    comment "MyText"
    star 1
    owner nil
    gadget nil
    guest nil
  end
end
