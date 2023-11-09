require 'liquid'
require 'fileutils'
require_relative '../lib/jekyll_begin_end'

RSpec.configure do |config|
  # config.order = 'random'
  config.filter_run_when_matching focus: true

  # See https://relishapp.com/rspec/rspec-core/docs/command-line/only-failures
  config.example_status_persistence_file_path = 'spec/status_persistence.txt'
end
