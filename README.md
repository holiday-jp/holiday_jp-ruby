# holiday_jp [<img src="https://secure.travis-ci.org/komagata/holiday_jp.png"/>](http://travis-ci.org/komagata/holiday_jp)

Get holidays in Japan.

## USAGE

```ruby
holidays = HolidayJp.between(Date.new(2010, 9, 14), Date.new(2010, 9, 21))
holidays.first.name # 敬老の日
HolidayJp.holiday?(Date.new(2016, 8 ,11)) # true
```

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
