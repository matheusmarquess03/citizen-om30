require 'rails_helper'

RSpec.describe "citizens/show", type: :view do
  before(:each) do
    @citizen = assign(:citizen, create(:citizen))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Full Name/)
    expect(rendered).to match(/CPF/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Birthdate/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/Status/)
  end
end