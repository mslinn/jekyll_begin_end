# frozen_string_literal: true

require 'liquid'
require 'fileutils'
require_relative '../lib/jekyll_begin_end'

RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = 'random'
end
