class CitizenMailer < ApplicationMailer
  def create_or_update(citizen)
    @citizen = citizen
    mail(to: @citizen.email, subject: 'Your informations of citizen was added or updated.')
  end
end