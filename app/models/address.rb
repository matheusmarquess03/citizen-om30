class Address < ApplicationRecord
  include SmsResource
  belongs_to :citizen

  validates :zipcode, format: { with: /\A[0-9]{5}-[0-9]{3}\z/i, message: "is in invalid format" }
  validates :public_place, presence: true
  validates :number, presence: true
  validates :neighborhood, presence: true
  validates :city, presence: true
  validates :state, presence: true

  def attributes_for_sms
    super(self.attributes.reject! { |a| a =~ /id|created_at|updated_at/ })
  end
end
