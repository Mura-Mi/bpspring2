FactoryGirl.define do
  factory :sns_profile do
    user nil
    provider 'twitter'
    uid "hogehoge"
    nickname "null"
  end

end
