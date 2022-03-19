`jekyll_begin_end`
[![Gem Version](https://badge.fury.io/rb/jekyll_begin_end.svg)](https://badge.fury.io/rb/jekyll_begin_end)
===========

Defines the following Jekyll filters:

 * `begins_with` — returns `true` if a string starts with a given substring.
 * `does_not_begin_with` — returns `false` if a string starts with a given substring.
 * `ends_with` — returns `true` if a string end with a given substring.
 * `does_not_end_with` — returns `false` if a string end with a given substring.
 * `append_suffix_if_does_not_start_with` — appends a suffix to the string if the string does not start with a substring.

## Syntax

:warning: Important: the name of each of these filters must be followed by a colon (:). If you fail to do that an error will be generated and the Jekyll site building process will halt. The error message looks something like this: `Liquid Warning: Liquid syntax error (line 285): Expected end_of_string but found string in "{{ lines | begins_with 'blah' | xml_escape }}" in /some_directory/some_files.html Liquid Exception: Liquid error (line 285): wrong number of arguments (given 1, expected 2) in /some_directory/some_file.html Error: Liquid error (line 285): wrong number of arguments (given 1, expected 2)`

### `begins_with`
First example:
```
{% assign url = "https:/asdf.com" %}
{% assign isAbsolute = url | begins_with: 'http' %}
```

Second example:
```
{% assign url = "https:/asdf.com" %}
{% if url | begins_with: 'http' %}
  <p>Absolute</p>
{% else %}
  <p>Relative</p>
{% endif %}
```

### `does_not_begin_with`
First example:
```
{% assign url = "https:/asdf.com" %}
{% assign isRelative = url | does_not_begin_with: 'http' %}
```

Second example
```
{% assign url = "https:/asdf.com" %}
{% if url | does_not_begin_with: 'http' %}
  <p>Relative</p>
{% else %}
  <p>Absolute</p>
{% endif %}
```

### `ends_with`
First example:
```
{% assign url = "https:/asdf.com" %}
{% assign isDotCom = url | ends_with: '.com' %}
```

Second example:
```
{% assign url = "https:/asdf.com" %}
{% if url | ends_with: '.com' %}
  <p>.com found</p>
{% else %}
  <p>Not a .com</p>
{% endif %}
```

### `does_not_end_with`
First example:
```
{% assign url = "https:/asdf.com" %}
{% assign isNotDotCom = url | does_not_end_with: '.com' %}
```

Second example:
```
{% assign url = "https:/asdf.com" %}
{% if url | does_not_end_with: '.com' %}
  <p>Not a .com</p>
{% else %}
  <p>.com found</p>
{% endif %}
```


### `append_suffix_if_does_not_start_with`
This filter was created to make asset reloading work better.

Given a portion of `_layouts/default.html` that looks like this:
```
{% assign csses = page.css | default: layout.css %}
{% assign nowMillis = site.time | date: '%s' %}
{% assign suffix = '?v=' | append: nowMillis %}
{% for css in csses %}
  <link rel="stylesheet" href="{{ css | append_suffix_if_does_not_start_with: 'http', suffix }}" type="text/css">
{% endfor %}
```
And given `index.html` with front matter that looks like this:
```
---
css: [
  https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css,
  /order/order.css
]
---
```

The following is generated. Note that the suffix s?v=1612879301 in only applied to the relative URL for `order.css`.
```
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" type="text/css">
<link rel="stylesheet" href="/order/order.css?v=1612879301" type="text/css">
```


### Additional Information
More information is available on my web site about [my Jekyll plugins](https://www.mslinn.com/blog/2020/10/03/jekyll-plugins.html).


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'jekyll_begin_end'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install jekyll_begin_end


## Development

After checking out the repo, run `bin/setup` to install dependencies.

You can also run `bin/console` for an interactive prompt that will allow you to experiment.


### Build and Install Locally
To build and install this gem onto your local machine, run:
```shell
$ rake install:local
```

The following also does the same thing:
```shell
$ bundle exec rake install
```

Examine the newly built gem:
```shell
$ gem info jekyll_begin_end

*** LOCAL GEMS ***

jekyll_begin_end (1.0.0)
    Author: Mike Slinn
    Homepage:
    https://github.com/mslinn/jekyll_begin_end
    License: MIT
    Installed at: /home/mslinn/.gems

    Generates Jekyll logger with colored output.
```


### Build and Push to RubyGems
To release a new version,
  1. Update the version number in `version.rb`.
  2. Commit all changes to git; if you don't the next step might fail with an unexplainable error message.
  3. Run the following:
     ```shell
     $ bundle exec rake release
     ```
     The above creates a git tag for the version, commits the created tag,
     and pushes the new `.gem` file to [RubyGems.org](https://rubygems.org).


## Contributing

1. Fork the project
2. Create a descriptively named feature branch
3. Add your feature
4. Submit a pull request


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
