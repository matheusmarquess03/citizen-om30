require 'rails_helper'

RSpec.describe Address, type: :model do
  it { should belong_to(:citizen) }

  it { should allow_value('09271-060').for(:zipcode) }
  it { should_not allow_value('09271060').for(:zipcode) }
  it { should_not allow_value('123456').for(:zipcode) }

  it { should validate_presence_of(:public_place) }

  it { should validate_presence_of(:neighborhood) }

  it { should validate_presence_of(:city) }

  it { should validate_presence_of(:state) }
end
