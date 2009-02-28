require 'rake'
require 'rake/rdoctask'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = "etsy4r"
    s.summary = %Q{Handcrafted API Wrapper}
    s.email = "tom.cocca@gmail.com"
    s.homepage = "http://github.com/tcocca/etsy4r"
    s.description = "TODO"
    s.authors = ["Tom Cocca"]
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

Rake::RDocTask.new do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'etsy4r'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

Dir['tasks/**/*.rake'].each { |t| load t }

task :default => :spec
