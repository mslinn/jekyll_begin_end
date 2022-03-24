# frozen_string_literal: true

require_relative "jekyll_begin_end/version"

# Jekyll filters for working with strings.

module StringFilter
  attr_accessor :logger

  def does_not_begin_with(text, query)
    !text.start_with? query
  end

  def begins_with(text, query)
    @logger.debug { "text=#{text} query=#{query} result: #{text.start_with? query}" }
    text.start_with? query
  end

  def does_not_end_with(text, query)
    !text.end_with? query
  end

  def ends_with(text, query)
    text.end_with? query
  end

  def append_suffix_if_does_not_start_with(text, query, suffix)
    text.start_with? query ? text : "#{text}#{suffix}"
  end
end

Jekyll::Hooks.register(:site, :after_reset) do |site|
  PluginMetaLogger.instance.info { "Loaded jekyll_begin_end v#{JekyllFromToUntil::VERSION} plugin." }
  StringFilter.logger = PluginLogger.new(self, site.config)
  Liquid::Template.register_filter(Jekyll::StringFilter)
end
