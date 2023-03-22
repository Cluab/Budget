FactoryBot.define do
  factory :user do
    name { 'MyString' }
    role { 'user' }
    email { 'johndoe@example.com' } # a valid email address
    password { 'password' }
  end
end
