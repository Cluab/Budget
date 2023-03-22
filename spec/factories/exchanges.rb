FactoryBot.define do
    factory :exchange do
      name { 'MyString' }
      amount { 10 }
      user { nil }
    end
  end