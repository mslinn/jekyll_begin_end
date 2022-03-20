# frozen_string_literal: true

require_relative "lib/jekyll_begin_end/version"

Gem::Specification.new do |spec|
  spec.authors = ["Mike Slinn"]
  spec.bindir = "exe"
  spec.description = <<~END_DESC
    This Jekyll plugin provides 3 filters that return portions of a multiline string: from, to and until.
    Regular expression is used to specify matches; the simplest regular expression is a string.
  END_DESC
  spec.email = ["mslinn@mslinn.com"]

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end

  spec.homepage = 'https://github.com/mslinn/jekyll_begin_end'
  spec.license = "MIT"
  spec.metadata = {
    "allowed_push_host" => "https://rubygems.org",
    "bug_tracker_uri"   => "#{spec.homepage}/issues",
    "changelog_uri"     => "#{spec.homepage}/CHANGELOG.md",
    "homepage_uri"      => spec.homepage,
    "source_code_uri"   => spec.homepage,
  }
  spec.name = "jekyll_begin_end"
  spec.require_paths = ["lib"]
  spec.required_ruby_version = ">= 2.6.0"
  spec.summary = "This Jekyll plugin provides 3 filters that return portions of a multiline string: from, to and until."
  spec.version = JekyllFromToUntil::VERSION

  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }

  spec.add_dependency "jekyll", ">= 3.5.0"
  spec.add_dependency "jekyll_plugin_logger"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "debase"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rubocop"
  spec.add_development_dependency "rubocop-jekyll"
  spec.add_development_dependency "rubocop-rake"
  spec.add_development_dependency "rubocop-rspec"
  spec.add_development_dependency "ruby-debug-ide"
end
