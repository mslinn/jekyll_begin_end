# frozen_string_literal: true

require 'liquid'
require 'fileutils'
require_relative '../lib/jekyll_begin_end'

RSpec.describe(JekyllFromToUntil) do
  include JekyllFromToUntil

  let(:lines) do
    <<~END_OF_LINES
      line 1
      line 2
      line 3
      line 4
      line 5
    END_OF_LINES
  end

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

  it 'verifies from' do
    expect(from(lines, '3')).to eq("line 3\nline 4\nline 5\n")
    expect(from(gitignore, 'PID')).to eq("RUNNING_PID\nmslinn_jekyll_plugins.zip\ncloud9.tar\ncloud9.zip\nmslinn_aws.tar\n")
  end

  it 'verifies to' do
    expect(to(lines, '3')).to eq("line 1\nline 2\nline 3\n")
    expect(to(gitignore, 'idea')).to eq(".bsp/\nproject/\ntarget/\n*.gz\n*.sublime*\n*.swp\n*.out\n*.Identifier\n*.log\n.idea*\n")
  end

  it 'verifies until' do
    # until is a Ruby keyword
    expect(method(:until).call(lines, '3')).to eq("line 1\nline 2\n")
    expect(method(:until).call(gitignore, 'idea')).to eq(".bsp/\nproject/\ntarget/\n*.gz\n*.sublime*\n*.swp\n*.out\n*.Identifier\n*.log\n")
  end

  it 'verifies from regex' do
    expect(from(gitignore, '^(cloud|sun)')).to eq("cloud9.tar\ncloud9.zip\nmslinn_aws.tar\n")
  end
end
