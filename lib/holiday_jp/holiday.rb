# -*- coding: utf-8 -*-
require 'date'
module HolidayJp
  class Holiday
    WDAY_NAMES = %w(日 月 火 水 木 金 土)

    EN_HOLIDAY_NAMES = {
      '元日' => "New Year's Day",
      '成人の日' => 'Coming of Age Day',
      '建国記念の日' => 'National Foundation Day',
      '春分の日' => 'Vernal Equinox Day',
      '憲法記念日' => 'Constitution Memorial Day',
      'みどりの日' => 'Greenery Day',
      'こどもの日' => "Children's Day",
      '海の日' => 'Marine Day',
      '山の日' => 'Mountain Day',
      '敬老の日' => 'Respect for the Aged Day',
      '秋分の日' => 'Autumnal Equinox Day',
      '体育の日' => 'Health and Sports Day',
      '文化の日' => 'National Culture Day',
      '勤労感謝の日' => 'Labor Thanksgiving Day',
      '天皇誕生日' => "Emperor's Birthday",
      '昭和の日' => 'Showa Day',
      '振替休日' => 'Holiday in lieu',
      '国民の休日' => "Citizen's Holiday",
      '即位礼正殿の儀' => 'The Ceremony of the Enthronement of His Majesty th Emperor (at the Seiden)',
      '昭和天皇の大喪の礼' => 'The Funeral Ceremony of Emperor Showa.',
      '皇太子徳仁親王の結婚の儀' => 'The Rite of Wedding of HIH Crown Prince Naruhito'
    }

    attr_reader :date, :name

    def initialize(date, name)
      @date = date
      @name = name
    end

    def name_en
      EN_HOLIDAY_NAMES[name]
    end

    def wday_name
      WDAY_NAMES[date.wday]
    end
    alias_method :week, :wday_name
  end
end
