require 'helper'

class TestHolidayJp < Test::Unit::TestCase
  should '#between return correct holidays' do
    holidays = HolidayJp.between(Date.new(2009, 1, 1), Date.new(2009, 1, 31))
    assert_equal holidays[0].date, Date.new(2009, 1, 1)
    assert_equal holidays[0].name, '元日'
    assert_equal holidays[1].date, Date.new(2009, 1, 12)
    assert_equal holidays[1].name, '成人の日'
  end
end
