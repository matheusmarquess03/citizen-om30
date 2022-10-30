module SmsResource
  extend ActiveSupport::Concern

  def attributes_for_sms(attributes)
    a = attributes.map do |key, value|
      "#{key}: #{value}"
    end
    a.compact.join("\r")+"\r"
  end

end