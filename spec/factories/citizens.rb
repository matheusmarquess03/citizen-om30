FactoryBot.define do
  factory :citizen do
    full_name { "MyString" }
    cpf { "MyString" }
    email { "MyString" }
    birthdate { "MyString" }
    phone { "MyString" }
    status { false }
  end
end
