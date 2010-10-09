require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "etsy4r"
    gem.summary = %Q{Handcrafted API Wrapper}
    gem.description = %Q{Handcrafted API Wrapper for Etsy utilizing httparty}
    gem.email = "tom.cocca@gmail.com"
    gem.homepage = "http://github.com/tcocca/etsy4r"
    gem.authors = ["Tom Cocca"]
    gem.add_dependency "oauth", ">= 0.4.3"
    gem.add_dependency "httparty", ">= 0.6.1"
    gem.add_dependency "hashie", ">= 0.4.0"
    gem.add_dependency "rash", ">= 0.2.0"
    gem.add_dependency "will_paginate", ">= 2.3.4"
    gem.add_development_dependency "rspec", ">= 1.2.9"
    gem.add_development_dependency "webmock", ">= 1.3.4"
    gem.add_development_dependency "vcr", ">= 1.1.2"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'spec/rake/spectask'
Spec::Rake::SpecTask.new(:spec) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.spec_files = FileList['spec/**/*_spec.rb']
end

Spec::Rake::SpecTask.new(:rcov) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :spec => :check_dependencies

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "rentjuicer #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
