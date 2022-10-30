class Citizen < ApplicationRecord
  validates_presence_of :full_name
  validates_presence_of :cpf
  validates :birthdate, format: { with: /\A[0-9]{2}\/[0-9]{2}\/[0-9]{4}\z/i, message: "is in invalid format" }
  validates_date :birthdate, before: lambda { 18.years.ago }, before_message: "minimum age is 18"
  validates_date :birthdate, after: lambda { 120.years.ago }, after_message: "maximum age is 120"
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "is in invalid format" }
  validates :phone, format: { with: /\A^[0-9]{2}\s\([0-9]{2}\)\s[0-9]{4}-[0-9]{4,5}\z/, message: "is in invalid format" }
  validates :status, inclusion: [true, false]
end
