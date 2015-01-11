# holiday_jp [<img src="https://secure.travis-ci.org/komagata/holiday_jp.png"/>](http://travis-ci.org/komagata/holiday_jp)

Get holidays in Japan.

## USAGE

    >> holidays = HolidayJp.between(Date.new(2010, 9, 14), Date.new(2010, 9, 21))
    >> holidays.first.name # 敬老の日

    # Loading Custom Definitions
    >> my_holiday = Date.new(2015, 5, 13)
    >> HolidayJp.holiday? my_holiday # false
    >> HolidayJp.add_custom_holiday_sources '/path/to/custom_holidays_1.yml', '/path/to/custom_holidays_2.yml'
    >> HolidayJp.holiday? my_holiday # true

## Note on Patches/Pull Requests
 
* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but
   bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

## Copyright

Copyright (c) 2009 Masaki Komagata. See LICENSE for details.
