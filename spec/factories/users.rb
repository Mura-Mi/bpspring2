FactoryGirl.define do
  sequence :email do |n|
    "hoge#{n}@example.com"
  end

  factory :user do
    name 'hoge'
    email
    password 'hogehoge'
  end

end
