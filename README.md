# ddd_domain

[![Gem Version](https://badge.fury.io/rb/ddd_domain.svg)](https://badge.fury.io/rb/ddd_domain)

## Installation

Add to your Gemfile:

```ruby
gem "ddd_domain", "~> 1.4" # for rails 8.0.x
```

Run the `bundle` command to install.

## USAGE

```shell
$ rails g domains [new_domain_name]
```

### DomainResult

`DddDomain::DomainResult` is a value object that represents the outcome of a domain layer operation.
Return it from the public methods of your domain layer, and convert it into the idiom of the upper layer (controllers, jobs, GraphQL mutations, etc.) right where you receive it.

```ruby
class Orders::Cancel
  def call(order)
    return DddDomain::DomainResult.failure("The order is already shipped") if order.shipped?

    order.cancel!
    DddDomain::DomainResult.success
  rescue ActiveRecord::ActiveRecordError => e
    DddDomain::DomainResult.failure(exception: e)
  end
end

result = Orders::Cancel.new.call(order)
result.success?  # => true if the operation succeeded
result.failure?  # => true if the operation failed
result.message   # => the reason a business rule was violated (meant to be shown to the user)
result.exception # => the original exception behind an unexpected failure (for logging and diagnostics)
```

If you prefer a shorter name, generate an initializer:

```shell
$ rails g domain_result
```

It creates `config/initializers/domain_result.rb`, which explains where `DddDomain::DomainResult` comes from.
Uncomment the last line of it to refer to the class as `DomainResult`:

```ruby
# DomainResult = DddDomain::DomainResult
```

## LICENSE
This project rocks and uses [MIT-LICENSE](/MIT-LICENSE).
