# ddd_domain

[![Gem Version](https://badge.fury.io/rb/ddd_domain.svg)](https://badge.fury.io/rb/ddd_domain)

## End of life

**ddd_domain 1.3.x has reached end of life and is no longer maintained.**

Rails 7.x is no longer supported by the Rails team, so this branch has been
frozen. 1.3.11 is the final release; no further bug fixes or dependency
updates will be published.

Already published 1.3.x versions remain available on RubyGems, so existing
Gemfiles keep working. For a maintained version, upgrade Rails and switch to:

```ruby
gem "ddd_domain", "~> 1.5" # for rails 8.1.x
gem "ddd_domain", "~> 1.4" # for rails 8.0.x
```

## Installation

Add to your Gemfile:

```ruby
gem "ddd_domain", "~> 1.3" # for rails 7.x
```

Run the `bundle` command to install.

## USAGE

```shell
$ rails g domains [new_domain_name]
```

## LICENSE
This project rocks and uses [MIT-LICENSE](/MIT-LICENSE).
