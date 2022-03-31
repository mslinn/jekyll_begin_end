# frozen_string_literal: true

require 'liquid'
require 'fileutils'
require_relative '../lib/jekyll_begin_end'

RSpec.describe(JekyllBeginEnd) do
  include JekyllBeginEnd

  let(:gitignore) do
    <<~END_OF_LINES
      .bsp/
      project/
      target/
      *.gz
      *.sublime*
      *.swp
      *.out
      *.Identifier
      *.log
      .idea*
      *.iml
      *.tmp
      *~
      ~*
      .DS_Store
      .idea
      .jekyll-cache/
      .jekyll-metadata
      .makeAwsBucketAndDistribution.log
      .sass-cache/
      .yardoc/
      __pycache__/
      __MACOSX
      _build/
      _package/
      _site/
      bin/*.class
      doc/
      jekyll/doc/
      node_modules/
      Notepad++/
      out/
      package/
      instances.json
      rescue_ubuntu2010
      rescue_ubuntu2010.b64
      landingPageShortName.md
      test.html
      RUNNING_PID
      mslinn_jekyll_plugins.zip
      cloud9.tar
      cloud9.zip
      mslinn_aws.tar
    END_OF_LINES
  end

  it 'verifies begins_with' do
    expect(begins_with("321", '3')).to be true
    expect(begins_with("321", '1')).to be false
  end

  it 'verifies ends_with' do
    expect(ends_with("321", '1')).to be true
    expect(ends_with("321", '3')).to be false
  end

  it 'verifies does_not_begin_with' do
    expect(does_not_begin_with("321", '1')).to be true
    expect(does_not_begin_with("321", '3')).to be false
  end

  it 'verifies does_not_end_with' do
    expect(does_not_end_with("321", '3')).to be true
    expect(does_not_end_with("321", '1')).to be false
  end

  it 'verifies append_suffix_if_does_not_start_with' do
    expect(append_suffix_if_does_not_start_with("321", '3', "x")).to eq("321")
    expect(append_suffix_if_does_not_start_with("321", '1', "x")).to eq("321x")
  end
end
