require 'benchmark'
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'lib'))
require 'holiday_jp'

def bench_holiday
Benchmark.measure {
  d = Date.new(2011, 9, 19)
  10000.times do
    HolidayJp.holiday?(d)
  end
}
end
def bench_between
Benchmark.measure {
  d = Date.new(2009, 1, 1)
  d2 = Date.new(2009, 12, 31)
  10000.times do
    HolidayJp.between(d,d2)
  end
}
end

puts bench_holiday
puts bench_between
