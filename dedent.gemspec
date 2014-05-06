# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "dedent/version"

Gem::Specification.new do |s|
  s.name        = "dedent"
  s.version     = Dedent::VERSION
  s.authors     = ["Caleb Spare"]
  s.email       = ["cespare@gmail.com"]
  s.homepage    = "https://github.com/cespare/ruby-dedent"
  s.license     = "MIT"
  s.summary     = %q{Adds a dedent method to String.}
  s.description = <<-EOS
This gem adds a dedent method to strings to strip leading spaces from each line while preserving indentation.
  EOS

  s.rubyforge_project = "dedent"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "minitest"
end
