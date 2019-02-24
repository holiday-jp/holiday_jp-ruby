# -*- coding: utf-8 -*-
require 'test/unit'
require 'net/http'
require 'yaml'

class TestHolidayJpYaml < Test::Unit::TestCase
  def test_yaml
    yaml = YAML.load_file(File.expand_path('../../holidays.yml', __FILE__))
    uri = URI.parse('https://raw.githubusercontent.com/holiday-jp/holiday_jp/v0.x/holidays.yml')
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    holiday_jp_yaml = YAML.load(http.get(uri.request_uri).body)
    yaml.map do |date, name|
      assert_equal holiday_jp_yaml[date], name
    end
    holiday_jp_yaml.map do |date, name|
      assert_equal yaml[date], name
    end
    assert_equal yaml.length, holiday_jp_yaml.length
  end
end
