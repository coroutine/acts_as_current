# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{acts_as_current}
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Coroutine", "John Dugan"]
  s.date = %q{2010-10-10}
  s.description = %q{This acts_as extension modifies ActiveRecord classes so they can carry a reference to the instance defined as current for the given request.  The library is particularly useful for providing the authenticated user object to models.}
  s.email = %q{gem@coroutine.com}
  s.extra_rdoc_files = [
    "README.rdoc"
  ]
  s.files = [
    ".gitignore",
     ".specification",
     "MIT-LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "acts_as_current.gemspec",
     "init.rb",
     "lib/acts_as_current.rb",
     "lib/acts_as_current/base.rb",
     "lib/acts_as_current/class_methods.rb",
     "lib/acts_as_current/instance_methods.rb",
     "rails/init.rb",
     "test/acts_as_current/base_test.rb",
     "test/acts_as_current/simple_test.rb",
     "test/acts_as_current/sti_test.rb",
     "test/test_helper.rb"
  ]
  s.homepage = %q{http://github.com/coroutine/acts_as_current}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Gem version of acts_as_current Rails plugin.}
  s.test_files = [
    "test/acts_as_current/base_test.rb",
     "test/acts_as_current/simple_test.rb",
     "test/acts_as_current/sti_test.rb",
     "test/test_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activerecord>, [">= 0"])
      s.add_development_dependency(%q<activesupport>, [">= 0"])
    else
      s.add_dependency(%q<activerecord>, [">= 0"])
      s.add_dependency(%q<activesupport>, [">= 0"])
    end
  else
    s.add_dependency(%q<activerecord>, [">= 0"])
    s.add_dependency(%q<activesupport>, [">= 0"])
  end
end

