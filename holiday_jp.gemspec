# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "holiday_jp/version"

Gem::Specification.new do |s|
  s.name        = "holiday_jp"
  s.version     = HolidayJp::VERSION
  s.authors     = ["Masaki Komagata"]
  s.email       = ["komagata@gmail.com"]
  s.homepage    = "http://github.com/komagata/holiday_jp"
  s.summary     = %q{Japanese Holidays.}
  s.description = %q{Japanese Holidays from 1970 to 2050.}

  s.rubyforge_project = "holiday_jp"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rake", '0.9.2.2'
  s.add_development_dependency "rdoc", '3.11'
  s.add_development_dependency "shoulda", '2.11.3'
end
