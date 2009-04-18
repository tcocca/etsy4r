# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{etsy4r}
  s.version = "0.3.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Tom Cocca"]
  s.date = %q{2009-04-17}
  s.description = %q{Handcrafted API Wrapper for Etsy utilizing httparty}
  s.email = %q{tom.cocca@gmail.com}
  s.files = ["README", "LICENSE", "Rakefile", "VERSION.yml", "etsy4r.gemspec", "lib/etsy4r.rb", "lib/etsy4r/category_commands.rb", "lib/etsy4r/client.rb", "lib/etsy4r/commands.rb", "lib/etsy4r/favorite_commands.rb", "lib/etsy4r/feedback_commands.rb", "lib/etsy4r/gift_guide_commands.rb", "lib/etsy4r/image_parser.rb", "lib/etsy4r/listing_commands.rb", "lib/etsy4r/response.rb", "lib/etsy4r/server_commands.rb", "lib/etsy4r/shop_commands.rb", "lib/etsy4r/tag_commands.rb", "lib/etsy4r/user_commands.rb", "spec/rcov.opts", "spec/spec.opts", "spec/spec_helper.rb", "spec/fixtures/images.html", "spec/etsy4r/category_commands_spec.rb", "spec/etsy4r/client_spec.rb", "spec/etsy4r/commands_spec.rb", "spec/etsy4r/favorite_commands_spec.rb", "spec/etsy4r/feedback_commands_spec.rb", "spec/etsy4r/gift_guide_commands_spec.rb", "spec/etsy4r/image_parser_spec.rb", "spec/etsy4r/listing_commands_spec.rb", "spec/etsy4r/server_commands_spec.rb", "spec/etsy4r/shop_commands_spec.rb", "spec/etsy4r/tag_commands_spec.rb", "spec/etsy4r/user_commands_spec.rb", "tasks/rspec.rake", "examples/etsy.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/tcocca/etsy4r}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Handcrafted API Wrapper}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<httparty>, [">= 0"])
      s.add_runtime_dependency(%q<hpricot>, [">= 0"])
    else
      s.add_dependency(%q<httparty>, [">= 0"])
      s.add_dependency(%q<hpricot>, [">= 0"])
    end
  else
    s.add_dependency(%q<httparty>, [">= 0"])
    s.add_dependency(%q<hpricot>, [">= 0"])
  end
end
