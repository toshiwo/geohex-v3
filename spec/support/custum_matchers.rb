require 'bigdecimal'

RSpec::Matchers.define :be_near_eql do |expected, precision|
  match do |actual|
    bigdecimal_actual = BigDecimal.new(actual.to_s).round(precision).ceil(precision)
    bigdecimal_expected = BigDecimal.new(expected.to_s).round(precision).ceil(precision)

    if expected == 180.0
      bigdecimal_actual.abs == bigdecimal_expected.abs
    else
      bigdecimal_actual == bigdecimal_expected
    end
  end
end
