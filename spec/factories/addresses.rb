FactoryBot.define do
  factory :address do
    zipcode { "MyString" }
    public_place { "MyString" }
    number { "MyString" }
    complement { "MyString" }
    neighborhood { "MyString" }
    city { "MyString" }
    state { "MyString" }
    ibge_code { "MyString" }
    citizen { nil }
  end
end
