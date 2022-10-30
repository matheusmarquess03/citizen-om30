require 'rails_helper'

RSpec.describe Citizen, type: :model do
  it { should have_one(:address) }

  it { should accept_nested_attributes_for(:address) }

  it { should validate_presence_of(:full_name) }

  it { should allow_value('414.444.908-42').for(:cpf) }
  it { should_not allow_value('41444490842').for(:cpf) }
  it { should_not allow_value('414.444.908-43').for(:cpf) }
  it { should_not allow_value('444').for(:cpf) }
  it { should_not allow_value('12345678900').for(:cpf) }

  it { should allow_value('55 (11) 12345678').for(:phone) }
  it { should allow_value('55 (11) 123456789').for(:phone) }
  it { should_not allow_value('55 (11) 1234567890').for(:phone) }
  it { should_not allow_value('12345678').for(:phone) }
  it { should_not allow_value('123456879').for(:phone) }

  it { should allow_value('10/10/1990').for(:birthdate) }
  it { should_not allow_value('10-10-1990').for(:birthdate) }
  it { should_not allow_value('1990/10/10').for(:birthdate) }
  it { should_not allow_value('10/10/2015').for(:birthdate) }
  it { should_not allow_value('10/10/1890').for(:birthdate) }

  it { should allow_value('fabiomaggilunardelli@gmail.com').for(:email) }
  it { should allow_value('fabio@uol.com.br').for(:email) }
  it { should_not allow_value('fabio@').for(:email) }
  it { should_not allow_value('fabio@gmail').for(:email) }
  it { should_not allow_value('fabio').for(:email) }
  it { should_not allow_value('fabio@uol').for(:email) }

  it { should validate_presence_of(:photo) }

  describe '#after_save' do
    it 'triggers a callback to notify citizen' do
      citizen = build(:citizen)
      expect(citizen).to receive(:notify_citizen)
      citizen.save
    end
  end

  describe "#notify_citizen" do
    it "equeue email" do
      ActiveJob::Base.queue_adapter = :test
      citizen = create(:citizen)
      expect {
        citizen.send(:notify_citizen)
      }.to have_enqueued_job(ActionMailer::DeliveryJob)
    end

    it "enqueue sms" do
      Rails.stub(env: ActiveSupport::StringInquirer.new("production"))
      ActiveJob::Base.queue_adapter = :test
      citizen = create(:citizen)
      expect {
        citizen.send(:notify_citizen)
      }.to have_enqueued_job(SendSmsJob)
    end
  end

  describe '.search_data' do
    it 'return correct merged attributes' do
      citizen = create(:citizen)
      expect(citizen.search_data).to eq(citizen.attributes.merge( public_place_from_relation: citizen.public_place_from_relation))
    end
  end

end
