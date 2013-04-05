require 'bigdecimal'

RSpec::Matchers.define :be_near_eql do |expected, precision|
  match do |actual|
    actual_f = BigDecimal.new(actual.to_s).round(precision).ceil(precision).to_f
    expected_f = BigDecimal.new(expected.to_s).round(precision).ceil(precision).to_f

    if expected == 180.0
      actual_f.abs == expected_f.abs
    else
      actual_f == expected_f
    end
  end
end
