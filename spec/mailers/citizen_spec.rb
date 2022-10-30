require "rails_helper"

RSpec.describe CitizenMailer, type: :mailer do
  let(:mail){ CitizenMailer.create_or_update(@c1 = create(:citizen)) }

  it "subject is 'Your informations of citizen was added or updated.'" do
    expect(mail.subject).to eq('Your informations of citizen was added or updated.')
  end

  it "send mail to citizen email" do
    expect(mail.to).to eq([@c1.email])
  end

  it "correct from email" do
    expect(mail.from).to eq(['maggilunardellidev@gmail.com'])
  end
end