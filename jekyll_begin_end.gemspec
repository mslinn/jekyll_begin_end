require_relative 'lib/jekyll_begin_end/version'

Gem::Specification.new do |spec|
  github = 'https://github.com/mslinn/jekyll_begin_end'

  spec.authors = ['Mike Slinn']
  spec.bindir = 'exe'
  spec.description = <<~END_DESC
    This Jekyll plugin defines the following Jekyll filters that return portions of a string:
    begins_with — returns true if a string starts with a given substring.
    does_not_begin_with — returns false if a string starts with a given substring.
    ends_with — returns true if a string end with a given substring.
    does_not_end_with — returns false if a string end with a given substring.
    append_suffix_if_does_not_start_with — appends a suffix to the string if the string does not start with a substring.
  END_DESC
  spec.email = ['mslinn@mslinn.com']
  spec.files = Dir['.rubocop.yml', 'LICENSE.*', 'Rakefile', '{lib,spec}/**/*', '*.gemspec', '*.md']
  spec.homepage = 'https://www.mslinn.com/jekyll/3000-jekyll-plugins.html#begin_end'
  spec.license = 'MIT'
  spec.metadata = {
    'allowed_push_host' => 'https://rubygems.org',
    'bug_tracker_uri'   => "#{github}/issues",
    'changelog_uri'     => "#{github}/CHANGELOG.md",
    'homepage_uri'      => spec.homepage,
    'source_code_uri'   => github,
  }
  spec.name = 'jekyll_begin_end'
  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 2.6.0'
  spec.summary = 'This Jekyll plugin provides 5 filters that return portions of a string: begins_with, ' \
                 'does_not_begin_with, ends_with, does_not_end_with and append_suffix_if_does_not_start_with.'
  spec.test_files = spec.files.grep(%r!^(test|spec|features)/!)
  spec.version = JekyllBeginEndVersion::VERSION

  spec.add_dependency 'jekyll', '>= 3.5.0'
  spec.add_dependency 'jekyll_plugin_logger'
end
