# -*- coding: utf-8 -*-
require 'test/unit'
require File.expand_path('../../lib/holiday_jp', __FILE__)

class TestHolidayJp < Test::Unit::TestCase
  def test_between
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

  def test_holiday? 
    assert HolidayJp.holiday?(Date.new(2011, 9, 19))
    assert !HolidayJp.holiday?(Date.new(2011, 9, 18))
  end

  def test_mountain_day_from_2016
    assert !HolidayJp.holiday?(Date.new(2015, 8, 11))
    (2016..2050).each do |year|
      assert HolidayJp.holiday?(Date.new(year, 8, 11))
    end
  end

  def test_custom_holiday
    my_holiday_1 = Date.new(2015, 5, 13)
    my_holiday_2 = Date.new(2015, 12, 7)

    assert !HolidayJp.holiday?(my_holiday_1)
    assert !HolidayJp.holiday?(my_holiday_2)

    custom_holidays_1 = File.expand_path("../custom_holidays_1.yml", __FILE__)
    custom_holidays_2 = File.expand_path("../custom_holidays_2.yml", __FILE__)
    HolidayJp.add_custom_holiday_sources custom_holidays_1, custom_holidays_2
    assert HolidayJp.holiday?(my_holiday_1)
    assert HolidayJp.holiday?(my_holiday_2)

    custom_holiday = HolidayJp.holiday?(my_holiday_1)
    assert_equal custom_holiday.name, "誕生日"
    assert_equal custom_holiday.name_en, nil
  end
end
