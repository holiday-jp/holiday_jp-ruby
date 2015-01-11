# -*- coding: utf-8 -*-
require 'yaml'

module HolidayJp
  class Holidays
    attr_accessor :holidays

    def initialize
      @holidays = {}
      holiday_sources.each do |source|
        YAML.load_file(source).each do |key, value|
          @holidays[key] = Holiday.new(key, value)
        end
      end
    end

    private

    def holiday_sources
      HolidayJp.default_holiday_sources
    end

  end
end
