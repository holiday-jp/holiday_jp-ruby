require 'test/unit'
require 'net/http'
require 'yaml'

class TestHolidayJpYaml < Test::Unit::TestCase
  def test_yaml
    yaml = {}
    file = File.expand_path("../../holidays.yml", __FILE__)
    if YAML.respond_to?(:unsafe_load_file)
      yaml = YAML.unsafe_load_file(file)
    else
      yaml = YAML.load_file(file)
    end
    holiday_jp_yaml = {}
    uri = URI.parse('https://raw.githubusercontent.com/holiday-jp/holiday_jp/v0.x/holidays.yml')
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    response_body = http.get(uri.request_uri).body
    if YAML.respond_to?(:unsafe_load)
      holiday_jp_yaml = YAML.unsafe_load(response_body)
    else
      holiday_jp_yaml = YAML.load(response_body)
    end
    yaml.map do |date, name|
      assert_equal holiday_jp_yaml[date], name
    end
    holiday_jp_yaml.map do |date, name|
      assert_equal yaml[date], name
    end
    assert_equal yaml.length, holiday_jp_yaml.length
  end
end
