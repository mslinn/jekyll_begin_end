# frozen_string_literal: true

require "jekyll_plugin_logger"
require_relative "jekyll_begin_end/version"

# Jekyll filters for working with multiline strings.

module Jekyll
  module StringFilter
    def does_not_begin_with(text, query)
      !text.start_with? query
    end

    def begins_with(text, query)
      debug "text=#{text} query=#{query} result: #{text.start_with? query}"
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
end

Liquid::Template.register_filter(Jekyll::StringFilter)
