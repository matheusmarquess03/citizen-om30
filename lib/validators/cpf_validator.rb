class CpfValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add attribute, (options[:message] || "is not valid") unless valid_format?(value) && valid_calc?(value)
  end

  def valid_format?(value)
    return if value.nil?
    value.match(/^[\d]{3}.[\d]{3}.[\d]{3}-[\d]{2}$/)
  end

  def valid_calc?(value)
    value = value.to_s
    value = value.gsub(/[^0-9]/, "")
    digit = value.slice(-2, 2)
    control = ""
    if value.size == 11
      factor = 0
      2.times do |i|
        sum = 0
        9.times do |j|
          sum += value.slice(j, 1).to_i * (10 + i - j)
        end
        sum += (factor * 2) if i == 1
        factor = (sum * 10) % 11
        factor = 0 if factor == 10
        control << factor.to_s
      end
    end
    control == digit
  end
end
