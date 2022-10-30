FactoryBot.define do
  factory :address do
    zipcode { "24716-360" }
    public_place { "Rua Fernando Galeane" }
    number { "261" }
    complement { "Complemento" }
    neighborhood { "Jardim Catarina" }
    city { "São Gonçalo" }
    state { "RJ" }
    ibge_code { "12345" }
  end
end
