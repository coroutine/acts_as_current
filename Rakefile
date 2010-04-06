require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'
require 'jeweler'


desc 'Default: run tests.'
task :default => [:test]


desc 'Test the plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end


desc 'Generate documentation for the plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'acts_as_current'
  rdoc.options << '--line-numbers --inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end


begin
  Jeweler::Tasks.new do |gemspec|
    gemspec.authors           = ["Coroutine", "John Dugan"]
    gemspec.description       = "This acts_as extension modifies ActiveRecord classes so they can carry a reference to the instance defined as current for the given request.  The library is particularly useful for providing the authenticated user object to models."
    gemspec.email             = "gem@coroutine.com"
    gemspec.homepage          = "http://github.com/coroutine/acts_as_current"
    gemspec.name              = "acts_as_current"
    gemspec.summary           = "Gem version of acts_as_current Rails plugin."
    
    gemspec.add_dependency("activerecord")
    gemspec.add_development_dependency("activesupport")
    gemspec.files.include("lib/**/*.rb")
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
end

