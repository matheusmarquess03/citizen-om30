FactoryBot.define do
  factory :citizen do
    full_name { "Usuario Fulano Silva" }
    cpf { "678.403.900-99" }
    email { "usuario@gmail.com" }
    birthdate { "14/10/1996" }
    phone { "55 (21) 12345678" }
    status { true }
    photo { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'images', 'test.png'), 'image/png') }
    association :address, factory: :address, strategy: :build
  end
end
