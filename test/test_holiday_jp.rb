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

  def test_between_accepts_datetime
    holidays = HolidayJp.between(DateTime.new(2008, 12, 23), DateTime.new(2009, 1, 12))
    assert_equal holidays[0].date, Date.new(2008, 12, 23)
    assert_equal holidays[1].date, Date.new(2009, 1, 1)
    assert_equal holidays[2].date, Date.new(2009, 1, 12)
  end

  def test_between_accepts_time
    holidays = HolidayJp.between(Time.new(2008, 12, 23), Time.new(2009, 1, 12))
    assert_equal holidays[0].date, Date.new(2008, 12, 23)
    assert_equal holidays[1].date, Date.new(2009, 1, 1)
    assert_equal holidays[2].date, Date.new(2009, 1, 12)
  end

  def test_holiday?
    assert_true HolidayJp.holiday?(Date.new(2011, 9, 19))
    assert_false HolidayJp.holiday?(Date.new(2011, 9, 18))
  end

  def test_holiday_p_accepts_datetime
    assert_true HolidayJp.holiday?(DateTime.new(2011, 9, 19))
    assert_false HolidayJp.holiday?(DateTime.new(2011, 9, 18))
  end

  def test_holiday_p_accepts_time
    assert_true HolidayJp.holiday?(Time.new(2011, 9, 19))
    assert_false HolidayJp.holiday?(Time.new(2011, 9, 18))
  end

  def test_mountain_day_from_2016
    assert_false HolidayJp.holiday?(Date.new(2015, 8, 11))
    (2016..2050).each do |year|
      next if year == 2020 || year == 2021 # Tokyo Olympic year
      assert_true HolidayJp.holiday?(Date.new(year, 8, 11))
    end
  end

  def test_emperors_birthday
    1970.upto(1988) do |year|
      assert_true HolidayJp.holiday?(Date.new(year, 4, 29))
    end

    1989.upto(2018) do |year|
      assert HolidayJp.holiday?(Date.new(year, 12, 23))
    end

    assert !HolidayJp.holiday?(Date.new(2019, 2, 23))
    assert !HolidayJp.holiday?(Date.new(2019, 12, 23))

    2020.upto(2050) do |year|
      assert HolidayJp.holiday?(Date.new(year, 2, 23))
    end
  end

  def test_emperors_enthronement
    assert HolidayJp.holiday?(Date.new(2019, 4, 30))
    assert HolidayJp.holiday?(Date.new(2019, 5, 1))
    assert HolidayJp.holiday?(Date.new(2019, 5, 2))
    assert HolidayJp.holiday?(Date.new(2019, 10, 22))
  end
end
