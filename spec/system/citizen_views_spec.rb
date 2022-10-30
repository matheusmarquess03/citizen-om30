require "rails_helper"

RSpec.describe "Citizens", :type => :system do
  it "index citizens contain citizens and buttons actions" do
    create(:citizen, full_name: 'Usuario 1')
    visit citizens_url
    expect(page).to have_text("New Citizen")
    expect(page).to have_text("Find Citizen")
    expect(page).to have_text("Show All")
    expect(page).to have_text("Usuario 1")
    expect(page).to have_text("More Info")
    expect(page).to have_text("Edit")
  end

  it "create citizen with valid info" do
    visit citizens_url
    click_link('New Citizen')
    fill_in('citizen[full_name]', :with => 'Usuario 1')
    fill_in('citizen[cpf]', :with => '989.550.810-73')
    fill_in('citizen[email]', :with => 'usuario@gmail.com')
    fill_in('citizen[birthdate]', :with => '10/10/1990')
    fill_in('citizen[phone]', :with => '55 (11) 412345678')
    fill_in('citizen[address_attributes][zipcode]', :with => '09271-060')
    fill_in('citizen[address_attributes][public_place]', :with => '')
    find('form input[type="file"]').set("#{Rails.root.to_s}/spec/support/images/test.png")
    sleep(5)
    fill_in('citizen[address_attributes][number]', :with => '100')
    click_button('Create Citizen')
    sleep(5)
    expect(page).to have_text("Citizen was created")
  end

  it "not create citizen with invalid info" do
    visit citizens_url
    click_link('New Citizen')
    fill_in('citizen[full_name]', :with => 'Usuario 1')
    fill_in('citizen[cpf]', :with => '989.550.810-73')
    fill_in('citizen[email]', :with => '')
    fill_in('citizen[birthdate]', :with => '10/10/1990')
    fill_in('citizen[phone]', :with => '55 (11) 412345678')
    fill_in('citizen[address_attributes][zipcode]', :with => '09271-060')
    fill_in('citizen[address_attributes][public_place]', :with => '')
    find('form input[type="file"]').set("#{Rails.root.to_s}/spec/support/images/test.png")
    sleep(5)
    fill_in('citizen[address_attributes][number]', :with => '100')
    click_button('Create Citizen')
    sleep(5)
    expect(page).to have_text("Citizen was not created")
  end

  it "show form to update citizen" do
    create(:citizen, full_name: 'Usuario 1')
    visit citizens_url
    click_link('Edit')
    expect(find_field('citizen[full_name]').value).to eq 'Usuario 1'
  end

  it "update citizen" do
    create(:citizen, full_name: 'Usuario 1')
    visit citizens_url
    click_link('Edit')
    fill_in('citizen[full_name]', :with => 'New full name')
    click_button('Update Citizen')
    expect(page).to have_text("Citizen was updated")
  end

  it "find citizen" do
    c1 = create(:citizen, full_name: 'Pedro Paulo')
    c2 = create(:citizen, full_name: 'Luiz Maranhao')
    c3 = create(:citizen, full_name: 'Maria da Silva')
    Citizen.reindex
    visit citizens_url
    click_link('Find Citizen')
    fill_in('query', :with => 'Maranhao')
    click_button('Find')
    expect(page).to have_css('table', text: c2.full_name)
    expect(page).to have_css('table', text: c2.cpf)
  end
end