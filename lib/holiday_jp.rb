# -*- coding: utf-8 -*-
require 'holiday_jp/holiday'
require 'holiday_jp/holidays'

module HolidayJp
  def self.between(start, last)
    Holidays.new.holidays.find_all do |date, _holiday|
      start <= date && date <= last
    end.map(&:last)
  end

  def self.holiday?(date)
    Holidays.new.holidays[date]
  end
end
