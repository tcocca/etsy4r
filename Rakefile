require 'rake'
require 'rake/rdoctask'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = "etsy4r"
    s.summary = %Q{Handcrafted API Wrapper}
    s.email = "tom.cocca@gmail.com"
    s.homepage = "http://github.com/tcocca/etsy4r"
    s.description = "Handcrafted API Wrapper for Etsy utilizing httparty"
    s.files = [
      "README",
      "LICENSE",
      "Rakefile",
      "VERSION.yml",
      "lib/etsy4r.rb",
      "lib/etsy4r/client.rb",
      "lib/etsy4r/commands.rb",
      "lib/etsy4r/favorite_commands.rb",
      "lib/etsy4r/gift_guide_commands.rb",
      "lib/etsy4r/image_parser.rb",
      "lib/etsy4r/response.rb",
      "lib/etsy4r/server_commands.rb",
      "lib/etsy4r/tag_commands.rb",
      "lib/etsy4r/user_commands.rb",
      "spec/rcov.opts",
      "spec/spec.opts",
      "spec/spec_helper.rb",
      "spec/fixtures/images.html",
      "spec/etsy4r/client_spec.rb",
      "spec/etsy4r/commands_spec.rb",
      "spec/etsy4r/favorite_commands_spec.rb",
      "spec/etsy4r/gift_guide_commands_spec.rb",
      "spec/etsy4r/image_parser_spec.rb",
      "spec/etsy4r/server_commands_spec.rb",
      "spec/etsy4r/tag_commands_spec.rb",
      "spec/etsy4r/user_commands_spec.rb",
      "tasks/rspec.rake",
      "examples/etsy.rb"
    ]
    s.authors = ["Tom Cocca"]
    s.add_dependency 'httparty'
    s.add_dependency 'hpricot'
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
