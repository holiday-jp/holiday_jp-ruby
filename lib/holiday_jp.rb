# -*- coding: utf-8 -*-
require 'date'
require 'ostruct'
require 'holiday_jp/holidays'

module HolidayJp
  DAYNAMES_JA = %w(日 月 火 水 木 金 土)

  # == Between date
  # === Example:
  #  >> holidays = HolidayJp.between(Date.new(2010, 9, 14), Date.new(2010, 9, 21))
  #  >> holidays.first.name # 敬老の日
  # === parameters
  # * <tt>start</tt>
  # * <tt>last</tt>
  def self.between(start, last)
    HOLIDAYS.map do |hd|
      start <= hd[:date] && hd[:date] <= last ? OpenStruct.new(hd) : nil
    end.compact
  end


  # == Whether the date is holiday or not.
  # === Example:
  # >> HolidayJp.holiday?(Date.new(2011, 9, 19)) # => true
  # === parameter(s)
  # * <tt>date</tt>
  def self.holiday?(date)
    HOLIDAYS.any? {|hd| hd[:date] == date }
  end
end
