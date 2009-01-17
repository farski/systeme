# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{systeme}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Chris Kalafarski"]
  s.date = %q{2009-01-16}
  s.description = %q{TODO}
  s.email = %q{chris@farski.com}
  s.files = ["VERSION.yml", "lib/systeme", "lib/systeme/metric.rb", "lib/systeme.rb", "test/metric_test.rb", "test/test_helper.rb"]
  s.homepage = %q{http://github.com/farski/systeme}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{TODO}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
