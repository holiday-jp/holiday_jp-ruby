# holiday_jp [![test](https://github.com/holiday-jp/holiday_jp-ruby/workflows/test/badge.svg)](https://github.com/holiday-jp/holiday_jp-ruby/actions)

Get holidays in Japan.

## USAGE

```ruby
holidays = HolidayJp.between(Date.new(2010, 9, 14), Date.new(2010, 9, 21))
holidays.first.name # 敬老の日
HolidayJp.holiday?(Date.new(2016, 8 ,11)) # true
```

## Supported Ruby Version
Ruby 1.9.3+

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'holiday_jp'
```

And then execute:

```sh
$ bundle
```

Or install it yourself as:

```sh
$ gem install holiday_jp
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
