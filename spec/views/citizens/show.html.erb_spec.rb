require 'rails_helper'

RSpec.describe "citizens/show", type: :view do
  before(:each) do
    @citizen = assign(:citizen, Citizen.create!(
      full_name: "Full Name",
      cpf: "Cpf",
      email: "Email",
      birthdate: "Birthdate",
      phone: "Phone",
      status: false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Full Name/)
    expect(rendered).to match(/Cpf/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Birthdate/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/false/)
  end
end
