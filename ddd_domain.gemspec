$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ddd_domain/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ddd_domain"
  s.version     = DddDomain::VERSION
  s.authors     = [""]
  s.email       = [""]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of DddDomain."
  s.description = "TODO: Description of DddDomain."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.4"

  s.add_development_dependency "sqlite3"
end
