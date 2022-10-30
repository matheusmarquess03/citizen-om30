class Citizen < ApplicationRecord
  has_one :address
  accepts_nested_attributes_for :address

  validates_presence_of :full_name
  validates :cpf, cpf: true
  validates :birthdate, format: { with: /\A[0-9]{2}\/[0-9]{2}\/[0-9]{4}\z/i, message: "is in invalid format" }
  validates_date :birthdate, before: lambda { 18.years.ago }, before_message: "minimum age is 18"
  validates_date :birthdate, after: lambda { 120.years.ago }, after_message: "maximum age is 120"
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "is in invalid format" }
  validates :phone, format: { with: /\A^[0-9]{2}\s\([0-9]{2}\)\s[0-9]{4}-[0-9]{4,5}\z/, message: "is in invalid format" }
  validates :status, inclusion: [true, false]
  validates :photo, presence: true

  has_attached_file :photo, styles: { medium: "100x100>", thumb: "30x30>" }
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

  after_save :notify_citizen

  private

  def notify_citizen
    CitizenMailer.create_or_update(self).deliver_now
  end
end
