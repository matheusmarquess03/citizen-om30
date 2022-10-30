class TwilioTextMessenger
  class << self
    def send(number, content)
      client = Twilio::REST::Client.new
      client.messages.create({
                               from: Rails.application.credentials.twilio_phone_number,
                               to: only_numbers(number),
                               body: format_body(content)
                             })
    end

    def only_numbers(number)
      number.scan(/\d/).join('')
    end

    def format_body(content)
      content.is_a?(String)? content : "#{content[:title]}\r\r#{content[:body]}"
    end
  end
end