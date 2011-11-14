require "bundler/gem_tasks"
require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

task :default => :test

require 'rdoc/task'
require 'holiday_jp/version'
Rake::RDocTask.new do |rdoc|
  version = HolidayJp::VERSION
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "holiday_jp #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
