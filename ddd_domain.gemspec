$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ddd_domain/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ddd_domain"
  s.version     = DddDomain::VERSION
  s.authors     = ["FUNABARA Masao"]
  s.email       = ["masao@masoo.jp"]
  s.homepage    = "https://github.com/masoo/ddd_domain"
  s.summary     = "It supports the domain of Domain Driven Design."
  s.description = "It generate the domain of Domain Driven Design."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 6.0.0"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "minitest"
end
