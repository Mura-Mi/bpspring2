FactoryGirl.define do
  sequence :email do |n|
    "hoge#{n}@example.com"
  end

  sequence :name do |n|
    "hoge#{n}"
  end

  factory :user do
    name
    email
    password 'hogehoge'
  end

end
