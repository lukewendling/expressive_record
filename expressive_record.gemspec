# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{expressive_record}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Luke Wendling"]
  s.date = %q{2008-11-17}
  s.description = %q{Add meaningful names for belongs_to associations to Rails 2.1 model object dirty changes}
  s.email = %q{luke@lukewendling.com}
  s.extra_rdoc_files = ["CHANGELOG", "lib/expressive_record.rb", "README.rdoc"]
  s.files = ["CHANGELOG", "expressive_record.gemspec", "init.rb", "lib/expressive_record.rb", "Manifest", "Rakefile", "README.rdoc"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/lukewendling/expressive_record}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Expressive_record", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{expressive_record}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Add meaningful names for belongs_to associations to Rails 2.1 model object dirty changes}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
