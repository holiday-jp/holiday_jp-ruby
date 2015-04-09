# -*- coding: utf-8 -*-
require 'holiday_jp/holiday'
require 'holiday_jp/holidays'

module HolidayJp
  def self.between(start, last)
    holidays.between(start, last)
  end

  def self.holiday?(date)
    holidays.holiday?(date)
  end

  private

  def self.holidays
    @@_holidays ||= Holidays.new
  end
end
