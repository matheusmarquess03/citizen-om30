class SendSmsJob < ApplicationJob
  queue_as :default

  def perform(number, content)
    TwilioTextMessenger.send(number, content)
  end
end