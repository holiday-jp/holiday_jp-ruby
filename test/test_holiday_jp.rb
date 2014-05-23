# -*- coding: utf-8 -*-
require 'helper'

class TestHolidayJp < Test::Unit::TestCase
  should '#between return correct holidays' do
    holidays = HolidayJp.between(Date.new(2009, 1, 1), Date.new(2009, 1, 31))
    new_year_day = holidays[0]
    assert_equal new_year_day.date, Date.new(2009, 1, 1)
    assert_equal new_year_day.name, '元日'
    assert_equal new_year_day.name_en, "New Year's Day"
    assert_equal new_year_day.week, '木'
    assert_equal new_year_day.wday_name, '木'
    assert_equal holidays[1].date, Date.new(2009, 1, 12)
    assert_equal holidays[1].name, '成人の日'
    holidays = HolidayJp.between(Date.new(2008, 12, 23), Date.new(2009, 1, 12))
    assert_equal holidays[0].date, Date.new(2008, 12, 23)
    assert_equal holidays[1].date, Date.new(2009, 1, 1)
    assert_equal holidays[2].date, Date.new(2009, 1, 12)
  end

  should '#holiday?(date) returns date is holiday or not' do
    assert HolidayJp.holiday?(Date.new(2011, 9, 19))
    assert !HolidayJp.holiday?(Date.new(2011, 9, 18))
  end

  should 'Mountain Day from 2016' do
    assert !HolidayJp.holiday?(Date.new(2015, 8, 11))
    (2016..2050).each do |year|
      assert HolidayJp.holiday?(Date.new(year, 8, 11))
    end
  end
end
