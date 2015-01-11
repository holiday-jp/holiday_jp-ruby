# -*- coding: utf-8 -*-
require 'holiday_jp/holiday'
require 'holiday_jp/holidays'

module HolidayJp

  class << self
    def between(start, last)
      Holidays.new.holidays.find_all do |date, _holiday|
        start <= date && date <= last
      end.map(&:last)
    end

    def holiday?(date)
      Holidays.new.holidays[date]
    end

    def add_custom_holiday_sources(*files)
      files.to_a.flatten.compact.uniq.each do |file|
        next unless File.exist? file
        add_custom_holiday_source file
      end
    end

    def holiday_sources
      default_holiday_sources.concat(custom_holiday_sources).flatten.freeze
    end

    private

    def add_custom_holiday_source(source)
      @custom_holiday_sources ||= []
      @custom_holiday_sources << source
    end

    def default_holiday_sources
      [File.expand_path("../../holidays.yml", __FILE__)]
    end

    def custom_holiday_sources
      @custom_holiday_sources.to_a
    end
  end
end
