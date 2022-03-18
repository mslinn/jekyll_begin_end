# frozen_string_literal: true

require_relative "lib/jekyll_begin_end/version"

Gem::Specification.new do |spec|
  spec.name = "jekyll_begin_end"
  spec.version = JekyllFromToUntil::VERSION
  spec.authors = ["Mike Slinn"]
  spec.email = ["mslinn@mslinn.com"]

  spec.summary = "This Jekyll plugin provides 3 filters that return portions of a multiline string: from, to and until."
  spec.description = <<~END_DESC
    This Jekyll plugin provides 3 filters that return portions of a multiline string: from, to and until.
    Regular expression is used to specify matches; the simplest regular expression is a string.
  END_DESC
  spec.homepage = 'https://github.com/mslinn/jekyll_begin_end'
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org/"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = 'https://github.com/mslinn/jekyll_begin_end'
  spec.metadata["changelog_uri"] = 'https://github.com/mslinn/jekyll_begin_end/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'jekyll'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'debase'
  spec.add_development_dependency 'jekyll'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rubocop-jekyll'
  spec.add_development_dependency 'rubocop-rake'
  spec.add_development_dependency 'ruby-debug-ide'
end
